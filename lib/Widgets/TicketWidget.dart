import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticksy/Controllers/HomeController.dart';

class TicketWidget extends StatefulWidget {
  // String ticketName;
  // String ticketDescription;
  // String ticketStatus;
  // String ticketPriority;
  // String ticketDepartment;

  final int ticketIdx;

  const TicketWidget({super.key, required this.ticketIdx});

  @override
  State<TicketWidget> createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
  HomeController hmController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle ticket tap
        hmController.setselectedTicketId(
          hmController.selectedList[widget.ticketIdx]["ticketId"],
        );
      },
      child: Row(
        children: [
          Container(
            height: Get.height / 6.29,
            width: Get.width / 22.5,

            decoration: BoxDecoration(
              color: hmController.getStatusColor(widget.ticketIdx),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: Get.height / 6.29,
              //width: Get.width / 1.14,
              decoration: BoxDecoration(
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
                          hmController.selectedList[widget
                              .ticketIdx]["ticketName"],
                          style: GoogleFonts.alata(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Image(
                          image: AssetImage(
                            'assets/images/${hmController.selectedList[widget.ticketIdx]["ticketPriority"]}.png',
                          ),
                          height: Get.height / 32,
                          width: Get.width / 14.4,
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height / 80),
                    Container(
                      width: Get.width / 1.38,
                      height: Get.height / 20,
                      child: Text(
                        hmController.selectedList[widget
                            .ticketIdx]["ticketDescription"],
                        style: GoogleFonts.alata(
                          fontSize: 13,
                          fontWeight: FontWeight.w200,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height / 160),
                    Text(
                      hmController.selectedList[widget
                          .ticketIdx]["ticketDepartment"],
                      style: GoogleFonts.alata(
                        fontSize: 10,
                        fontWeight: FontWeight.w200,
                        color: Color(0xff1778F2),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        children: [
                          Text(
                            hmController
                                .selectedList[widget.ticketIdx]["creationTime"]
                                .toString()
                                .substring(0, 10),
                            style: GoogleFonts.alata(
                              fontSize: 7,
                              fontWeight: FontWeight.w200,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            hmController
                                .selectedList[widget.ticketIdx]["creationTime"]
                                .toString()
                                .substring(11),
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
