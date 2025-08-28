import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticksy/Screens/ChatScreen.dart';

class HomeController extends GetxController {
  String name = "Srijith";

  late List<Map<String, dynamic>> selectedList = allTickets;
  //TextScaler textScale = MediaQuery.of(context).textScaler;
  List<Map<String, dynamic>> getSelectedList(int idx) {
    switch (idx) {
      case 0:
        selectedList = allTickets;
        return allTickets;
      case 1:
        selectedList = newTickets;
        return newTickets;
      case 2:
        selectedList = ongoingTickets;
        return ongoingTickets;
      case 3:
        selectedList = closedTickets;
        return closedTickets;
      default:
        selectedList = [];
    }
    update();
    return selectedList;
  }

  Color getStatusColor(int ticketIdx) {
    final status = selectedList[ticketIdx]["ticketStatus"]?.toString().trim();

    if (status == "Closed") {
      return Colors.red;
    } else if (status == "Ongoing") {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  String selectedTicketId = "";
  void setselectedTicketId(String id) {
    selectedTicketId = id;
    update();
    Get.to(() => ChatScreen());
  }

  final List<Map<String, dynamic>> allTickets = [
    {
      "ticketId": "TCKT001",
      "ticketName": "Failed Online Transaction",
      "ticketDescription":
          "Customer reports failed UPI payment but amount debited.",
      "ticketStatus": "New",
      "ticketPriority": "High",
      "ticketDepartment": "Payments",
      "creationTime": "2025-08-20 10:15:00",
      "lastUpdatedTime": "2025-08-20 10:15:00",
    },
    {
      "ticketId": "TCKT002",
      "ticketName": "ATM Cash Not Dispensed",
      "ticketDescription":
          "ATM did not dispense cash, amount deducted from account.",
      "ticketStatus": "Ongoing",
      "ticketPriority": "High",
      "ticketDepartment": "ATM Services",
      "creationTime": "2025-08-19 09:45:00",
      "lastUpdatedTime": "2025-08-20 11:30:00",
    },
    {
      "ticketId": "TCKT003",
      "ticketName": "Update Contact Number",
      "ticketDescription": "Customer requested mobile number update.",
      "ticketStatus": "Closed",
      "ticketPriority": "Low",
      "ticketDepartment": "Customer Support",
      "creationTime": "2025-08-18 14:20:00",
      "lastUpdatedTime": "2025-08-19 12:10:00",
    },
    {
      "ticketId": "TCKT004",
      "ticketName": "Credit Card Limit Increase",
      "ticketDescription":
          "Request for increasing credit card limit due to higher usage.",
      "ticketStatus": "Ongoing",
      "ticketPriority": "Medium",
      "ticketDepartment": "Credit Cards",
      "creationTime": "2025-08-17 16:50:00",
      "lastUpdatedTime": "2025-08-20 13:00:00",
    },
    {
      "ticketId": "TCKT005",
      "ticketName": "Cheque Clearance Delay",
      "ticketDescription":
          "Cheque deposited but not cleared for more than 3 working days.",
      "ticketStatus": "New",
      "ticketPriority": "Medium",
      "ticketDepartment": "Branch Operations",
      "creationTime": "2025-08-21 09:30:00",
      "lastUpdatedTime": "2025-08-21 09:30:00",
    },
    {
      "ticketId": "TCKT006",
      "ticketName": "NetBanking Login Issue",
      "ticketDescription":
          "Customer unable to login to netbanking with correct credentials.",
      "ticketStatus": "Ongoing",
      "ticketPriority": "High",
      "ticketDepartment": "IT Support",
      "creationTime": "2025-08-20 18:40:00",
      "lastUpdatedTime": "2025-08-21 08:20:00",
    },
    {
      "ticketId": "TCKT007",
      "ticketName": "Debit Card Block Request",
      "ticketDescription":
          "Lost debit card, customer requested to block immediately.",
      "ticketStatus": "Closed",
      "ticketPriority": "High",
      "ticketDepartment": "Card Services",
      "creationTime": "2025-08-19 11:25:00",
      "lastUpdatedTime": "2025-08-19 11:40:00",
    },
    {
      "ticketId": "TCKT008",
      "ticketName": "Loan Prepayment Inquiry",
      "ticketDescription":
          "Customer requested details about loan prepayment penalties.",
      "ticketStatus": "New",
      "ticketPriority": "Low",
      "ticketDepartment": "Loans",
      "creationTime": "2025-08-21 12:10:00",
      "lastUpdatedTime": "2025-08-21 12:10:00",
    },
    {
      "ticketId": "TCKT009",
      "ticketName": "Wrong Beneficiary Transfer",
      "ticketDescription":
          "Funds transferred to wrong account due to incorrect IFSC.",
      "ticketStatus": "Ongoing",
      "ticketPriority": "High",
      "ticketDepartment": "Payments",
      "creationTime": "2025-08-20 15:30:00",
      "lastUpdatedTime": "2025-08-21 09:15:00",
    },
    {
      "ticketId": "TCKT010",
      "ticketName": "Passbook Printing Request",
      "ticketDescription":
          "Customer requested for updated passbook printing at branch.",
      "ticketStatus": "Closed",
      "ticketPriority": "Low",
      "ticketDepartment": "Branch Operations",
      "creationTime": "2025-08-18 10:00:00",
      "lastUpdatedTime": "2025-08-18 15:30:00",
    },
  ];

  late final List<Map<String, dynamic>> newTickets = allTickets
      .where((ticket) => ticket["ticketStatus"] == "New")
      .toList();

  late final List<Map<String, dynamic>> ongoingTickets = allTickets
      .where((ticket) => ticket["ticketStatus"] == "Ongoing")
      .toList();

  late final List<Map<String, dynamic>> closedTickets = allTickets
      .where((ticket) => ticket["ticketStatus"] == "Closed")
      .toList();
}
