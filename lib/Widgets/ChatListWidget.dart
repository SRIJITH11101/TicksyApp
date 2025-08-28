import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticksy/Controllers/ChatController.dart';
import 'package:ticksy/Widgets/ChatWidget.dart';

class ChatListWidget extends StatefulWidget {
  const ChatListWidget({super.key});

  @override
  State<ChatListWidget> createState() => _ChatListWidgetState();
}

class _ChatListWidgetState extends State<ChatListWidget> {
  final ChatController chController = Get.find<ChatController>();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chController.chatList.length,
      itemBuilder: (context, index) {
        final chat = chController.chatList[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: Get.height / 40),
            ChatWidget(chat: chat),
            //SizedBox(height: Get.height / 40),
          ],
        );
      },
    );
  }
}
