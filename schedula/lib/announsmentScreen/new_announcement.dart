import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class NewAnnouncement extends StatefulWidget {
  const NewAnnouncement({super.key});

  @override
  State<NewAnnouncement> createState() => _NewAnnouncementState();
}

class _NewAnnouncementState extends State<NewAnnouncement> {
  String? _fileName;
  File? file;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg', 'docx'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        file = File(result.files.single.path!);
        _fileName = result.files.single.name;
      });
      print('File is successfully picked: $_fileName');
    }
  }

  Future<String?> uploadFileToFirebase() async {
    try {
      if (file == null) {
        print('No file selected');
        return null;
      }

      String fileName = file!.path.split('/').last;
      TaskSnapshot snapshot = await FirebaseStorage.instance
          .ref('uploads/$fileName')
          .putFile(file!);

      String? downloadUrl = await snapshot.ref.getDownloadURL();
      print('File upload successful');
      return downloadUrl;
    } on FirebaseException catch (e) {
      print('Error occurred: $e');
    }
    return null;
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _announceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 60,
          ),
          TextField(
            maxLength: 25,
            controller: _titleController,
            decoration: const InputDecoration(
              label: Text('Announcement'),
            ),
          ),
          TextField(
            controller: _announceController,
            decoration: const InputDecoration(
              label: Text('Details'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  pickFile();
                },
                child: const Text('Upload resource'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  _fileName ?? 'No file selected',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () async {
                  // String? downloadUrl = await uploadFileToFirebase();
                  // if (downloadUrl != null) {
                  //   showLoadingDialoge(context);
                  //   ClassNotes notes = ClassNotes(
                  //     courseTitle: _titleController.text,
                  //     downloadURL: downloadUrl,
                  //     courseTecher: _codeController.text,
                  //   );
                  //   await sendClassNotesToFirestore(notes);
                  // }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Save Notes',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
