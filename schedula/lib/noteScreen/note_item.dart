import 'package:cloud_firestore/cloud_firestore.dart';
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
  const NotesItem(
    this.notesItem, {
    super.key,
    required this.isStart,
    required this.isEnd,
    required this.task,
  });

  final ClassNotes notesItem;
  final bool isStart;
  final bool isEnd;
  final int task;

  Future<void> delete() async {
    try {
      await FirebaseFirestore.instance
          .collection('notes')
          .doc(notesItem.docID)
          .delete();
    } catch (error) {
      print('Error deleting class: $error');
    }
    print(notesItem.docID);
  }

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
    void showDeleteDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete'),
            content: const Text('Are you sure you want to delete this note?'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
              TextButton(
                onPressed: () async {
                  await widget.delete();
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Delete'),
              ),
            ],
          );
        },
      );
    }

    return PaperCard(
      backgroundColor: Colors.green[100],
      borderRadius: 20,
      elevation: 3,
      borderColor: Colors.green[700],
      borderThickness: 10,
      textureOpacity: 2,
      margin: const EdgeInsets.all(5),
      textureFit: BoxFit.cover,
      texture: true,
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Text(
                  widget.notesItem.courseTitle,
                  style: GoogleFonts.getFont(
                    'Montserrat',
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
                    'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  showDeleteDialog(context);
                },
                icon: const Icon(Icons.delete),
              ),
              const SizedBox(
                height: 10,
              ),
              IconButton(
                  onPressed: () {
                    String downloadURL = widget.notesItem.downloadURL;
                    downloadFile(downloadURL);
                  },
                  icon: const Icon(Icons.download)),
            ],
          ),
        ],
      ),
    );
  }
}
