import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ticksy/Controllers/HomeController.dart';

class ChatController extends GetxController {
  HomeController hmController = Get.find<HomeController>();

  final TextEditingController chatController = TextEditingController();
  late String ticketId = hmController.selectedTicketId;
  late List<Map<String, dynamic>> chatList = getTicketsById(ticketId);
  final ImagePicker picker = ImagePicker();

  List<File?> pickedFiles = [];

  Map<String, dynamic>? getTicket() {
    try {
      return ticketChats.firstWhere((chat) => chat["ticketId"] == ticketId);
    } catch (e) {
      return null; // return null if not found
    }
  }

  List<Map<String, dynamic>> getTicketsById(String ticketId) {
    return ticketChats.where((chat) => chat["ticketId"] == ticketId).toList();
  }

  String get ticketName {
    final ticket = getTicket();
    return ticket?["ticketName"] ?? "Unknown Ticket";
  }

  String get ticketDepartment {
    final ticket = getTicket();
    return ticket?["ticketDepartment"] ?? "Unknown Department";
  }

  Color getStatusColor() {
    final ticket = getTicket();
    if (ticket == null) return Colors.grey;

    final status = ticket["ticketStatus"].toString();

    if (status == "New") {
      return Colors.green;
    } else if (status == "Ongoing") {
      return Colors.orange;
    } else if (status == "Closed") {
      return Colors.red;
    } else {
      return Colors.grey; // fallback
    }
  }

  void cameraHandler() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      // Handle the selected image
      pickedFiles.add(File(pickedFile.path));
      update();
    }
  }

  void galleryHandler() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Handle the selected image
      pickedFiles.add(File(pickedFile.path));
      update();
    }
  }

  void fileHandler() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // Handle the selected files
      pickedFiles.addAll(result.paths.map((path) => File(path!)));
      update();
    }
  }

  final List<Map<String, dynamic>> ticketChats = [
    // ------------------ TICKET 1 ------------------
    {
      "ticketId": "TCKT001",
      "ticketName": "Failed Online Transaction",
      "ticketDepartment": "Payments",
      "ticketStatus": "New",
      "chatId": "CHAT001",
      "message": "Customer reports failed UPI payment but amount debited.",
      "sentBy": "User",
      "creationTime": "2025-08-20 10:15:00",
      "isRead": true,
    },
    {
      "ticketId": "TCKT001",
      "ticketName": "Failed Online Transaction",
      "ticketDepartment": "Payments",
      "ticketStatus": "New",
      "chatId": "CHAT002",
      "message":
          "Hello, I made a payment of ₹500 yesterday, the money was debited but the merchant didn’t receive it.",
      "sentBy": "User",
      "creationTime": "2025-08-20 10:17:00",
      "isRead": true,
    },
    {
      "ticketId": "TCKT001",
      "ticketName": "Failed Online Transaction",
      "ticketDepartment": "Payments",
      "ticketStatus": "New",
      "chatId": "CHAT003",
      "message":
          "We apologize for the inconvenience. Could you please provide the transaction ID or UTR number?",
      "sentBy": "Agent",
      "creationTime": "2025-08-20 10:20:00",
      "isRead": true,
    },
    {
      "ticketId": "TCKT001",
      "ticketName": "Failed Online Transaction",
      "ticketDepartment": "Payments",
      "ticketStatus": "New",
      "chatId": "CHAT004",
      "message": "Yes, the UTR number is 1234567890.",
      "sentBy": "User",
      "creationTime": "2025-08-20 10:22:00",
      "isRead": true,
    },
    {
      "ticketId": "TCKT001",
      "ticketName": "Failed Online Transaction",
      "ticketDepartment": "Payments",
      "ticketStatus": "New",
      "chatId": "CHAT005",
      "message": "Thank you. We are checking the transaction status with NPCI.",
      "sentBy": "Agent",
      "creationTime": "2025-08-20 10:25:00",
      "isRead": false,
    },
    {
      "ticketId": "TCKT001",
      "ticketName": "Failed Online Transaction",
      "ticketDepartment": "Payments",
      "ticketStatus": "New",
      "chatId": "CHAT006",
      "message": "Alright, how long will this take?",
      "sentBy": "User",
      "creationTime": "2025-08-20 10:27:00",
      "isRead": false,
    },
    {
      "ticketId": "TCKT001",
      "ticketName": "Failed Online Transaction",
      "ticketDepartment": "Payments",
      "ticketStatus": "New",
      "chatId": "CHAT007",
      "message":
          "Usually 2-3 working days. If the transaction fails, the refund will be automatically credited back to your account.",
      "sentBy": "Agent",
      "creationTime": "2025-08-20 10:30:00",
      "isRead": false,
    },
    {
      "ticketId": "TCKT001",
      "ticketName": "Failed Online Transaction",
      "ticketDepartment": "Payments",
      "ticketStatus": "New",
      "chatId": "CHAT008",
      "message": "Got it, thank you.",
      "sentBy": "User",
      "creationTime": "2025-08-20 10:31:00",
      "isRead": false,
    },

    // ------------------ TICKET 2 ------------------
    {
      "ticketId": "TCKT002",
      "ticketName": "ATM Cash Not Dispensed",
      "ticketDepartment": "ATM Services",
      "ticketStatus": "Ongoing",
      "chatId": "CHAT009",
      "message": "ATM did not dispense cash, amount deducted from account.",
      "sentBy": "User",
      "creationTime": "2025-08-19 09:45:00",
      "isRead": true,
    },
    {
      "ticketId": "TCKT002",
      "ticketName": "ATM Cash Not Dispensed",
      "ticketDepartment": "ATM Services",
      "ticketStatus": "Ongoing",
      "chatId": "CHAT010",
      "message":
          "I tried to withdraw ₹2000 from ATM, but no cash came out, and the money is debited.",
      "sentBy": "User",
      "creationTime": "2025-08-19 09:47:00",
      "isRead": true,
    },
    {
      "ticketId": "TCKT002",
      "ticketName": "ATM Cash Not Dispensed",
      "ticketDepartment": "ATM Services",
      "ticketStatus": "Ongoing",
      "chatId": "CHAT011",
      "message":
          "Sorry to hear this. Could you provide the ATM location and approximate time of transaction?",
      "sentBy": "Agent",
      "creationTime": "2025-08-19 09:50:00",
      "isRead": true,
    },
    {
      "ticketId": "TCKT002",
      "ticketName": "ATM Cash Not Dispensed",
      "ticketDepartment": "ATM Services",
      "ticketStatus": "Ongoing",
      "chatId": "CHAT012",
      "message": "It was at Vijayawada Main Branch ATM around 9:30 AM.",
      "sentBy": "User",
      "creationTime": "2025-08-19 09:52:00",
      "isRead": true,
    },
    {
      "ticketId": "TCKT002",
      "ticketName": "ATM Cash Not Dispensed",
      "ticketDepartment": "ATM Services",
      "ticketStatus": "Ongoing",
      "chatId": "CHAT013",
      "message":
          "Thanks. We have registered your complaint. Investigation usually takes up to 7 working days.",
      "sentBy": "Agent",
      "creationTime": "2025-08-19 09:55:00",
      "isRead": true,
    },
    {
      "ticketId": "TCKT002",
      "ticketName": "ATM Cash Not Dispensed",
      "ticketDepartment": "ATM Services",
      "ticketStatus": "Ongoing",
      "chatId": "CHAT014",
      "message": "Do I need to visit the branch for this?",
      "sentBy": "User",
      "creationTime": "2025-08-19 09:57:00",
      "isRead": false,
    },
    {
      "ticketId": "TCKT002",
      "ticketName": "ATM Cash Not Dispensed",
      "ticketDepartment": "ATM Services",
      "ticketStatus": "Ongoing",
      "chatId": "CHAT015",
      "message":
          "No branch visit needed. The amount will be reversed automatically once verified.",
      "sentBy": "Agent",
      "creationTime": "2025-08-19 10:00:00",
      "isRead": false,
    },
    {
      "ticketId": "TCKT002",
      "ticketName": "ATM Cash Not Dispensed",
      "ticketDepartment": "ATM Services",
      "ticketStatus": "Ongoing",
      "chatId": "CHAT016",
      "message": "Alright, I’ll wait. Thanks for your help.",
      "sentBy": "User",
      "creationTime": "2025-08-19 10:02:00",
      "isRead": false,
    },
  ];
}
