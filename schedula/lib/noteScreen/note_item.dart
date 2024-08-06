import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_card/paper_card.dart';
import 'package:schedula/noteScreen/notes_model.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:schedula/utils/all_dialouge.dart';
import 'dart:io';

import 'package:schedula/utils/toast_message.dart';

class NotesItem extends StatefulWidget {
  const NotesItem({super.key, required this.notesItem});

  final ClassNotes notesItem;

  @override
  State<NotesItem> createState() => _NotesItemState();
}

class _NotesItemState extends State<NotesItem> {
  bool _isDownloading = false;
  String _progress = "";
  String? _filePath;

  Future<void> downloadFile(String downloadURL) async {
    // Request storage permission
    var status = await Permission.storage.request();
    if (status.isGranted) {
      setState(() {
        _isDownloading = true;
      });

      try {
        // Get the Downloads directory
        Directory downloadsDirectory =
            Directory('/storage/emulated/0/Download');
        if (!downloadsDirectory.existsSync()) {
          downloadsDirectory =
              await getExternalStorageDirectory() ?? downloadsDirectory;
        }

        // Extract the file name and extension from the URL
        String fileName = downloadURL.split('/').last.split('?').first;
        String filePath = '${downloadsDirectory.path}/$fileName';

        // Download the file
        Dio dio = Dio();
        await dio.download(
          downloadURL,
          filePath,
          onReceiveProgress: (received, total) {
            if (total != -1) {
              setState(() {
                _progress = "${((received / total) * 100).toStringAsFixed(0)}%";
                showToastMessageNormal('Download Started');
              });
            }
          },
        );

        setState(() {
          _filePath = filePath;
        });

        print('File downloaded to $filePath');
        showSuccessDialoge(context);
        showToastMessageNormal('File downloaded to $filePath');
      } catch (e) {
        print('Failed to download file: $e');
        showToastMessageWarning('Failed to download file: $e');
      } finally {
        setState(() {
          _isDownloading = false;
        });
      }
    } else {
      print('Storage permission denied');
      showToastMessageWarning('Storage permission denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PaperCard(
      backgroundColor: Colors.green,
      borderRadius: 20,
      elevation: 3,
      borderColor: Colors.red[500],
      borderThickness: 10,
      textureOpacity: 2,
      margin: const EdgeInsets.all(5),
      textureFit: BoxFit.cover,
      texture: true,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Text(
              widget.notesItem.courseTitle,
              style: GoogleFonts.getFont(
                'Lumanosimo',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Text(
              widget.notesItem.courseTitle,
              style: GoogleFonts.getFont(
                'Lumanosimo',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Text(widget.notesItem.downloadURL),
          ),
          Row(
            children: [
              const Spacer(),
              IconButton(
                  onPressed: () {
                    String downloadURL = widget.notesItem.downloadURL;
                    downloadFile(downloadURL);
                  },
                  icon: const Icon(Icons.download)),
            ],
          )
        ],
      ),
    );
  }
}
