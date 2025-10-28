import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticksy/Controllers/ChatController.dart';
import 'package:ticksy/Widgets/AttachmentWidget.dart';
import 'package:ticksy/Widgets/ChatListWidget.dart';
import 'package:ticksy/Widgets/FilePreviewRow.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    TextScaler textScale = MediaQuery.of(context).textScaler;
    return GetBuilder<ChatController>(
      init: ChatController(),
      builder: (ChatController chController) {
        return Scaffold(
          backgroundColor: Color(0xFFE9E9E9),
          appBar: AppBar(
            backgroundColor: Color(0xFFE9E9E9),
            toolbarHeight: Get.height / 6.83,
            leading: IconButton(
              onPressed: Get.back,
              icon: Icon(Icons.arrow_back_ios_rounded),
            ),
            title: Container(
              height: Get.height / 14.81,
              width: Get.width / 1.7,
              decoration: BoxDecoration(
                color: chController.getStatusColor(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //SizedBox(height: Get.height / 14.03),
                  Text(
                    chController.ticketName,
                    style: GoogleFonts.alata(
                      fontSize: textScale.scale(15),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    chController.ticketDepartment,
                    style: GoogleFonts.alata(
                      fontSize: textScale.scale(10),
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Here the chat has to be displayed
                Expanded(child: ChatListWidget()),
                chController.pickedFiles.isEmpty
                    ? SizedBox(height: Get.height / 40)
                    : FilePreviewRow(),
                Padding(
                  padding: EdgeInsets.only(
                    left: Get.width / 18,
                    bottom: Get.height / 28.57,
                    right: Get.width / 18,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // TextField box
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.blue, width: 1),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: TextField(
                                    controller: chController.chatController,
                                    minLines: 1,
                                    maxLines: 6,
                                    keyboardType: TextInputType.multiline,
                                    style: GoogleFonts.alata(
                                      fontSize: textScale.scale(18),
                                      fontWeight: FontWeight.w200,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      isCollapsed: true,
                                      hintText: 'Type Here',
                                      hintStyle: GoogleFonts.alata(
                                        fontSize: textScale.scale(15),
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              AttachmentWidget(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: Get.width / 72),
                      InkWell(
                        onTap: () {
                          chController.sendMessage();
                        },
                        child: Container(
                          height: Get.height / 20,
                          width: Get.width / 9,
                          child: Image.asset('assets/images/send.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}



// height: Get.height / 20,
//                           width: Get.width / 1.33,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20),
//                           ),