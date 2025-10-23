import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ticksy/Controllers/HomeController.dart';

class AddTicketWidget extends StatefulWidget {
  const AddTicketWidget({super.key});

  @override
  State<AddTicketWidget> createState() => _AddTicketWidgetState();
}

class _AddTicketWidgetState extends State<AddTicketWidget> {
  HomeController hmController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    TextScaler textScale = MediaQuery.of(context).textScaler;
    return FloatingActionButton(
      onPressed: () {
        showMaterialModalBottomSheet(
          context: context,
          builder: (context) => SingleChildScrollView(
            controller: ModalScrollController.of(context),
            child: Container(
              height: Get.height / 1.49,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close, size: textScale.scale(25)),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.width / 12.41,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "New Ticket",
                            style: GoogleFonts.alata(
                              fontSize: textScale.scale(25),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height / 42),
                        Text(
                          "Title",
                          style: GoogleFonts.alata(
                            fontSize: textScale.scale(15),
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: Get.height / 14.7,
                          width: Get.width / 1.2,
                          child: TextField(
                            controller: hmController.newTicketNameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                left: 10,
                                top: 10,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: Get.height / 37),
                        Text(
                          "Enter Ticket Description",
                          style: GoogleFonts.alata(
                            fontSize: textScale.scale(15),
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: Get.height / 3.53,
                          width: Get.width / 1.2,
                          child: TextField(
                            controller:
                                hmController.newTicketDescriptionController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                left: 10,
                                top: 10,
                              ),
                              hintText: "Type here...",
                              hintStyle: GoogleFonts.alata(
                                fontSize: textScale.scale(13),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height / 25.80),
                        Center(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: Get.height / 19.04,
                              width: Get.width / 3.49,
                              decoration: BoxDecoration(
                                color: Color(0xff1778F2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Create",
                                  style: GoogleFonts.alata(
                                    fontSize: textScale.scale(15),
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      backgroundColor: Colors.black,
      child: Icon(Icons.add, color: Colors.white, size: textScale.scale(50)),
    );
  }
}
