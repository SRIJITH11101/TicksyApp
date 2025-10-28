import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticksy/Models/Message.dart';

class ChatWidget extends StatefulWidget {
  final Message chat;
  const ChatWidget({super.key, required this.chat});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaler;
    final bool isUser = widget.chat.sentBy.toLowerCase() == "user";

    return Column(
      crossAxisAlignment: isUser
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: isUser
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            // Left-side profile image for Agent
            !isUser
                ? Image.asset(
                    'assets/images/chatProfile.png',
                    height: 30,
                    width: 30,
                  )
                : const SizedBox(),

            Container(
              width: Get.width / 2.09,
              decoration: BoxDecoration(
                color: isUser
                    ? const Color(0xff56BB71)
                    : const Color(0xff4F555A),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.chat.text,
                      style: GoogleFonts.alata(
                        fontSize: textScale.scale(12),
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        widget.chat.createdAt != null
                            ? _formatTime(widget.chat.createdAt!)
                            : '',
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

            // Right-side profile image for User
            isUser
                ? Image.asset(
                    'assets/images/chatProfile.png',
                    height: 30,
                    width: 30,
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }

  // ---------- Helper: Format timestamp ----------
  String _formatTime(DateTime dateTime) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return "$hours:$minutes";
  }
}
