import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticksy/Controllers/HomeController.dart';
import 'package:ticksy/Models/Ticket.dart';

class TicketWidget extends StatefulWidget {
  final int ticketIdx;

  const TicketWidget({super.key, required this.ticketIdx});

  @override
  State<TicketWidget> createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
  final HomeController hmController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final Ticket ticket = hmController.selectedList[widget.ticketIdx];

    return InkWell(
      onTap: () {
        hmController.setSelectedTicketId(ticket.id!);
        hmController.update();
      },
      child: Row(
        children: [
          Container(
            height: Get.height / 6.29,
            width: Get.width / 22.5,
            decoration: BoxDecoration(
              color: hmController.getStatusColor(widget.ticketIdx),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: Get.height / 6.29,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: Get.height / 57.14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ticket.subject ?? "",
                          style: GoogleFonts.alata(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Image(
                          image: AssetImage(
                            'assets/images/${ticket.priority?.toLowerCase()}.png',
                          ),
                          height: Get.height / 32,
                          width: Get.width / 14.4,
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height / 80),
                    SizedBox(
                      width: Get.width / 1.38,
                      height: Get.height / 20,
                      child: Text(
                        ticket.description ?? "",
                        style: GoogleFonts.alata(
                          fontSize: 13,
                          fontWeight: FontWeight.w200,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height / 160),
                    Text(
                      ticket.department ?? "",
                      style: GoogleFonts.alata(
                        fontSize: 10,
                        fontWeight: FontWeight.w200,
                        color: const Color(0xff1778F2),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        children: [
                          Text(
                            ticket.createdAt != null
                                ? ticket.createdAt.toString().substring(0, 10)
                                : "",
                            style: GoogleFonts.alata(
                              fontSize: 7,
                              fontWeight: FontWeight.w200,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            ticket.createdAt != null
                                ? ticket.createdAt.toString().substring(11, 19)
                                : "",
                            style: GoogleFonts.alata(
                              fontSize: 7,
                              fontWeight: FontWeight.w200,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
