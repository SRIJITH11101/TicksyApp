import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';
import 'package:ticksy/APICalls/ApiRequests.dart';
import 'package:ticksy/Controllers/HomeController.dart';
import 'package:ticksy/Models/Message.dart';
import 'package:ticksy/Models/Ticket.dart';

class ChatController extends GetxController {
  final HomeController hmController = Get.find<HomeController>();
  final api = ApiRequests();
  final authStorage = GetStorage();
  final TextEditingController chatController = TextEditingController();
  final ImagePicker picker = ImagePicker();

  var pickedFiles = <File?>[];
  var chatList = <Message>[].obs;
  var isLoading = false.obs;

  late String ticketId = hmController.selectedTicketId;

  StompClient? stompClient;

  // ---------- Lifecycle ----------
  @override
  void onInit() {
    super.onInit();
    fetchMessages();
    connectWebSocket();
  }

  @override
  void onClose() {
    disconnectWebSocket();
    chatController.dispose();
    super.onClose();
  }

  // ---------- API ----------
  Future<void> fetchMessages() async {
    try {
      isLoading.value = true;
      final fetched = await api.getMessagesByTicketId(
        ticketId,
        authStorage.read('accessToken'),
      );
      chatList.assignAll(fetched);
    } catch (e) {
      print("Error fetching messages: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // ---------- WebSocket ----------
  void connectWebSocket() {
    final token = authStorage.read('accessToken');

    stompClient = StompClient(
      config: StompConfig.sockJS(
        url: 'http://172.18.162.144:8080/ws',
        onConnect: (StompFrame frame) {
          print('✅ WebSocket connected');

          // Subscribe to topic for this ticket
          stompClient!.subscribe(
            destination: '/topic/ticket/$ticketId',
            callback: (StompFrame frame) {
              if (frame.body != null) {
                final msg = Message.fromJson(
                  Map<String, dynamic>.from(jsonDecode(frame.body!)),
                );
                chatList.add(msg);
              }
            },
          );
        },
        beforeConnect: () async {
          print('Connecting WebSocket...');
          await Future.delayed(const Duration(milliseconds: 300));
        },
        onWebSocketError: (dynamic error) => print('❌ WebSocket error: $error'),
        stompConnectHeaders: {'Authorization': 'Bearer $token'},
        webSocketConnectHeaders: {'Authorization': 'Bearer $token'},
      ),
    );

    stompClient!.activate();
  }

  void disconnectWebSocket() {
    stompClient?.deactivate();
    print('🧹 WebSocket disconnected');
  }

  // ---------- Send Message ----------
  void sendMessage() {
    if (chatController.text.trim().isEmpty) return;
    final msgText = chatController.text.trim();

    final msg = {
      'ticketId': ticketId,
      'text': msgText,
      'originalLang': 'en',
      'translatedLang': 'en',
      'sentBy': 'USER',
      'attachmentUrls': pickedFiles.isEmpty
          ? []
          : pickedFiles
                .map((file) => file!.path)
                .toList(), // adjust when uploading
    };

    print("🚀 Sending message via WebSocket: ${jsonEncode(msg)}");
    stompClient?.send(destination: '/app/sendMessage', body: jsonEncode(msg));

    chatController.clear();
    pickedFiles.clear();
  }

  // ---------- Ticket Info ----------
  Ticket? getTicket() {
    try {
      return hmController.allTickets.firstWhere((t) => t.id == ticketId);
    } catch (e) {
      return null;
    }
  }

  String get ticketName => getTicket()?.subject ?? "Unknown Ticket";
  String get ticketDepartment =>
      getTicket()?.department ?? "Unknown Department";
  String get ticketPriority => getTicket()?.priority ?? "Unknown";

  Color getStatusColor() {
    String status = getTicket()?.status ?? "";
    switch (status) {
      case "NEW":
        return Colors.green;
      case "ONGOING":
        return Colors.orange;
      case "CLOSED":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  // ---------- File Handling ----------
  void cameraHandler() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      pickedFiles.add(File(pickedFile.path));
      update();
    }
  }

  void galleryHandler() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedFiles.add(File(pickedFile.path));
      update();
    }
  }

  void fileHandler() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      pickedFiles.addAll(result.paths.map((path) => File(path!)));
      update();
    }
  }
}
