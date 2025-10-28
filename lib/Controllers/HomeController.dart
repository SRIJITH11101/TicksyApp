import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ticksy/APICalls/ApiRequests.dart';
import 'package:ticksy/Models/Ticket.dart';
import 'package:ticksy/Screens/ChatScreen.dart';

class HomeController extends GetxController {
  final authStorage = GetStorage();
  final api = ApiRequests();
  String? name;
  List<Ticket> allTickets = [];
  List<Ticket> selectedList = [];
  bool isTicketFetching = false;

  @override
  Future<void> onInit() async {
    super.onInit();
    isTicketFetching = true;
    update();
    name = authStorage.read('username');
    allTickets = await api.fetchUserTickets(
      authStorage.read('userId'),
      authStorage.read('accessToken'),
    );
    selectedList = allTickets; // initially show all tickets
    isTicketFetching = false;
    update();
  }

  TextEditingController newTicketNameController = TextEditingController();
  TextEditingController newTicketDescriptionController =
      TextEditingController();

  // Filtering by status
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
