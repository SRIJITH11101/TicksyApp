//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticksy/Controllers/ChatController.dart';

class FilePreviewRow extends StatefulWidget {
  //final List<File> pickedFiles;

  const FilePreviewRow({super.key});

  @override
  State<FilePreviewRow> createState() => _FilePreviewRowState();
}

class _FilePreviewRowState extends State<FilePreviewRow> {
  ChatController chatController = Get.find<ChatController>();
  //late List<File> files;

  @override
  void initState() {
    super.initState();
    //files = List.from(chatController.pickedFiles); // copy initial list
  }

  void _removeFile(int index) {
    setState(() {
      //files.removeAt(index);
      chatController.pickedFiles.removeAt(index);
      chatController.update();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(chatController.pickedFiles.length, (index) {
          final file = chatController.pickedFiles[index];
          final path = file!.path.toLowerCase();

          Widget preview;
          if (path.endsWith(".jpg") ||
              path.endsWith(".png") ||
              path.endsWith(".jpeg")) {
            preview = Image.file(file, fit: BoxFit.cover);
          } else if (path.endsWith(".pdf")) {
            preview = const Icon(
              Icons.picture_as_pdf,
              size: 40,
              color: Colors.red,
            );
          } else {
            preview = const Icon(
              Icons.insert_drive_file,
              size: 40,
              color: Colors.blueGrey,
            );
          }

          return Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: Get.width / 4.5,
                height: Get.height / 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Center(child: preview),
                ),
              ),
              Positioned(
                top: -8,
                right: -8,
                child: IconButton(
                  icon: const Icon(
                    Icons.delete_rounded,
                    size: 18,
                    color: Colors.red,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () => _removeFile(index),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
