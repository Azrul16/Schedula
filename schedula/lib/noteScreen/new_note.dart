import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class NewNote extends StatefulWidget {
  const NewNote({super.key});

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  String? _fileName;
  String? _filePath;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg', 'pptx', 'docx'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _fileName = result.files.single.name;
        _filePath = result.files.single.path!;
      });
    } else {
      // User canceled the picker
    }
  }

  // final _titleController = TextEditingController();
  // final _Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          const TextField(
            maxLength: 25,
            decoration: InputDecoration(
              label: Text('Course Title'),
            ),
          ),
          const TextField(
            maxLength: 8,
            decoration: InputDecoration(
              label: Text('Course Code'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: _pickFile,
                child: const Text('Upload file'),
              ),
            ],
          ),
          if (_fileName != null && _filePath != null)
            Column(
              children: [
                Text('File Name: $_fileName'),
                Text('File Path: $_filePath'),
              ],
            ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {},
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
