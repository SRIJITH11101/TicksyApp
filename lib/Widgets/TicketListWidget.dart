import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticksy/Controllers/HomeController.dart';
import 'package:ticksy/Widgets/TicketWidget.dart';

class TicketListWidget extends StatefulWidget {
  const TicketListWidget({super.key});

  @override
  State<TicketListWidget> createState() => _TicketListWidgetState();
}

class _TicketListWidgetState extends State<TicketListWidget> {
  final HomeController hmController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: hmController.selectedList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            TicketWidget(ticketIdx: index),
            SizedBox(height: screenHeight / 40),
          ],
        );
      },
    );
  }
}
