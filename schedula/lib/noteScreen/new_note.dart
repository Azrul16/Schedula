import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:schedula/classScreen/new_class.dart';
import 'package:schedula/noteScreen/notes_model.dart';
import 'package:schedula/utils/all_dialouge.dart';
import 'package:schedula/utils/toast_message.dart';

class NewNote extends StatefulWidget {
  const NewNote({super.key});

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  String? _fileName;
  File? file;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg', 'pptx', 'docx'],
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
  final TextEditingController _codeController = TextEditingController();

  Future<void> sendClassNotesToFirestore(ClassNotes notes) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      await firestore.collection('notes').add(notes.toJson());
      print('ClassNotes added to Firestore successfully');
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      showToastMessageNormal('Note uploaded');
    } catch (e) {
      print('Error adding ClassNotes to Firestore: $e');
      showToastMessageWarning('Error uploading');
    }
  }

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
            controller: _titleController,
            decoration: const InputDecoration(
              label: Text('Note Title'),
            ),
          ),
          TextField(
            controller: _codeController,
            decoration: const InputDecoration(
              label: Text('Course Teacher'),
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
                child: const Text('Upload file'),
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
                  String? downloadUrl = await uploadFileToFirebase();
                  if (downloadUrl != null) {
                    showLoadingDialoge(context);
                    ClassNotes notes = ClassNotes(
                      courseTitle: _titleController.text,
                      downloadURL: downloadUrl,
                      courseTecher: _codeController.text,
                      docID: '',
                    );
                    await sendClassNotesToFirestore(notes);
                    sendTopicNotification(
                      _titleController.text,
                      _codeController.text,
                    );
                  }
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
