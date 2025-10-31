import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ticksy/APICalls/ApiRequests.dart';
import 'package:ticksy/Models/Ticket.dart';
import 'package:ticksy/Models/TicketReq.dart';
import 'package:ticksy/Screens/ChatScreen.dart';

class HomeController extends GetxController {
  final authStorage = GetStorage();
  final api = ApiRequests();
  String? name;
  List<Ticket> allTickets = [];
  List<Ticket> selectedList = [];
  bool isTicketFetching = false;

  TextEditingController newTicketNameController = TextEditingController();
  TextEditingController newTicketDescriptionController =
      TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadTickets();
  }

  Future<void> loadTickets() async {
    isTicketFetching = true;
    update();
    name = authStorage.read('username');
    allTickets = await api.fetchUserTickets(
      authStorage.read('userId'),
      authStorage.read('accessToken'),
    );
    selectedList = allTickets;
    isTicketFetching = false;
    update();
  }

  Future<void> reloadTickets() async {
    await loadTickets();
  }

  // ✅ Create new ticket and refresh list
  Future<void> createNewTicket() async {
    final title = newTicketNameController.text.trim();
    final desc = newTicketDescriptionController.text.trim();
    final ticketReq = new TicketReq(
      userId: authStorage.read('userId'),
      subject: title,
      description: desc,
      originalLang: "en",
      translateLang: "en",
    );

    if (title.isEmpty || desc.isEmpty) {
      Get.snackbar("Error", "Please enter title and description");
      return;
    }

    try {
      await api.createTicket(ticketReq, authStorage.read('accessToken'));

      // Clear text fields after successful creation
      newTicketNameController.clear();
      newTicketDescriptionController.clear();

      // Refresh tickets
      await reloadTickets();

      Get.back(); // Close bottom sheet
      Get.snackbar("Success", "Ticket created successfully");
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Failed to create ticket: $e");
    }
  }

  // Filtering tickets by tab
  List<Ticket> getSelectedList(int idx) {
    switch (idx) {
      case 0:
        selectedList = allTickets;
        break;
      case 1:
        selectedList = allTickets
            .where((t) => t.status.toLowerCase() == "new")
            .toList();
        break;
      case 2:
        selectedList = allTickets
            .where((t) => t.status.toLowerCase() == "ongoing")
            .toList();
        break;
      case 3:
        selectedList = allTickets
            .where((t) => t.status.toLowerCase() == "closed")
            .toList();
        break;
      default:
        selectedList = [];
    }
    update();
    return selectedList;
  }

  Color getStatusColor(int index) {
    final status = selectedList[index].status.toLowerCase();
    if (status == "closed") return Colors.red;
    if (status == "ongoing") return Colors.orange;
    return Colors.green;
  }

  String selectedTicketId = "";
  void setSelectedTicketId(String id) {
    selectedTicketId = id;
    print("ticket id: $id .....................");
    update();
    Get.to(() => ChatScreen());
  }
}
