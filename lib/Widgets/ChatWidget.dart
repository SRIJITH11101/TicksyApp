import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatWidget extends StatefulWidget {
  final Map<String, dynamic> chat;
  const ChatWidget({super.key, required this.chat});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaler;
    return Column(
      crossAxisAlignment: widget.chat["sentBy"] == "User"
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: widget.chat["sentBy"] == "User"
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            widget.chat["sentBy"] == "Agent"
                ? Image.asset(
                    'assets/images/chatProfile.png',
                    height: 30,
                    width: 30,
                  )
                : SizedBox(),
            Container(
              width: Get.width / 2.09,
              decoration: BoxDecoration(
                color: widget.chat["sentBy"] == "User"
                    ? Color(0xff56BB71)
                    : Color(0xff4F555A),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: Get.width / 36,
                  right: Get.width / 36,
                  top: Get.height / 57.14,
                  bottom: Get.height / 100,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.chat["message"],
                      style: GoogleFonts.alata(
                        fontSize: textScale.scale(12),
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        widget.chat["creationTime"],
                        style: GoogleFonts.alata(
                          fontSize: textScale.scale(10),
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            widget.chat["sentBy"] == "User"
                ? Image.asset(
                    'assets/images/chatProfile.png',
                    height: 30,
                    width: 30,
                  )
                : SizedBox(),
          ],
        ),
      ],
    );
  }
}
