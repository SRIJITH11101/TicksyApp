import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticksy/Controllers/ChatController.dart';

class AttachmentWidget extends StatefulWidget {
  const AttachmentWidget({super.key});

  @override
  State<AttachmentWidget> createState() => _AttachmentWidgetState();
}

class _AttachmentWidgetState extends State<AttachmentWidget> {
  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.find<ChatController>();
    return PopupMenuButton<String>(
      icon: Icon(Icons.attach_file_rounded),
      offset: const Offset(35, -165),
      onSelected: (value) {
        if (value == "camera") {
          chatController.cameraHandler();
        } else if (value == "gallery") {
          chatController.galleryHandler();
        } else if (value == "file") {
          // handle file
          chatController.fileHandler();
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: "camera",
          child: Row(
            children: [
              Icon(Icons.camera_alt, color: Colors.redAccent),
              SizedBox(width: 10),
              Text("Camera"),
            ],
          ),
        ),
        PopupMenuItem(
          value: "gallery",
          child: Row(
            children: [
              Icon(Icons.image, color: Colors.blue),
              SizedBox(width: 10),
              Text("Gallery"),
            ],
          ),
        ),
        PopupMenuItem(
          value: "file",
          child: Row(
            children: [
              Icon(Icons.insert_drive_file, color: Colors.green),
              SizedBox(width: 10),
              Text("File"),
            ],
          ),
        ),
      ],
    );
  }
}
