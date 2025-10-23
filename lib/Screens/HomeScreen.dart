import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticksy/Controllers/HomeController.dart';
import 'package:ticksy/Widgets/AddTicketWidget.dart';
import 'package:ticksy/Widgets/TicketListWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TextScaler textScale = MediaQuery.of(context).textScaler;
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (HomeController hmController) {
        return Scaffold(
          backgroundColor: Color(0xFFE9E9E9),
          appBar: AppBar(
            backgroundColor: Color(0xFFE9E9E9),
            leadingWidth: Get.width,
            toolbarHeight: Get.height / 4.70,
            leading: Padding(
              padding: EdgeInsets.only(left: Get.width / 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height / 55),
                  Icon(
                    Icons.menu_rounded,
                    color: Colors.black,

                    size: textScale.scale(35),
                  ),
                  SizedBox(height: Get.height / 28.57),
                  Text(
                    'Welcome',
                    style: GoogleFonts.alata(
                      fontSize: textScale.scale(30),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '${hmController.name}!!',
                    style: GoogleFonts.alata(
                      fontSize: textScale.scale(30),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  //Container(height: 30, width: 40, color: Colors.white),
                ],
              ),
            ),
          ),

          body: SafeArea(
            child: DefaultTabController(
              length: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ButtonsTabBar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    unselectedBackgroundColor: Color(0xFFD9D9D9),
                    width: Get.width / 4.23,
                    contentCenter: true,
                    buttonMargin: EdgeInsets.only(left: Get.width / 15),
                    height: Get.height / 26.67,
                    onTap: (index) {
                      hmController.getSelectedList(index);
                      hmController.update();
                    },
                    tabs: <Widget>[
                      Tab(
                        child: Text(
                          'All',
                          style: GoogleFonts.alata(
                            fontSize: textScale.scale(15),
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'New',
                          style: GoogleFonts.alata(
                            fontSize: textScale.scale(15),
                            fontWeight: FontWeight.w400,
                            color: Color(0xff34A853),
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'On Going',
                          style: GoogleFonts.alata(
                            fontSize: textScale.scale(15),
                            fontWeight: FontWeight.w400,
                            color: Color(0xffFBBC05),
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Closed',
                          style: GoogleFonts.alata(
                            fontSize: textScale.scale(15),
                            fontWeight: FontWeight.w400,
                            color: Color(0xffEA4335),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height / 53.3),
                  Padding(
                    padding: EdgeInsets.only(left: Get.width / 15),
                    child: Text(
                      'Recent Tickets',
                      style: GoogleFonts.alata(
                        fontSize: textScale.scale(15),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height / 53.3),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width / 15),
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          TicketListWidget(), // All
                          TicketListWidget(), // New
                          TicketListWidget(), // On Going
                          TicketListWidget(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: AddTicketWidget(),
        );
      },
    );
  }
}
