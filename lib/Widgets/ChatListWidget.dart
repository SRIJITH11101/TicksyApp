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
    return Obx(() {
      if (chController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (chController.chatList.isEmpty) {
        return const Center(child: Text('No messages yet'));
      }

      return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: Get.height / 40),
        itemCount: chController.chatList.length,
        itemBuilder: (context, index) {
          final chat = chController.chatList[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ChatWidget(chat: chat),
              SizedBox(height: Get.height / 40),
            ],
          );
        },
      );
    });
  }
}
