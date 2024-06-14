import 'package:flutter/material.dart';

class NewClass extends StatefulWidget {
  const NewClass({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NewClassState();
  }
}

class _NewClassState extends State<NewClass> {
  final _titleController = TextEditingController();
  final _teacherController = TextEditingController();
  final _courseController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _teacherController.dispose();
    _courseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Course Title'),
            ),
          ),
          TextField(
            controller: _teacherController,
            maxLength: 30,
            decoration: const InputDecoration(
              label: Text("Teacher's name"),
            ),
          ),
          TextField(
            controller: _courseController,
            maxLength: 7,
            decoration: const InputDecoration(
              label: Text('Course Code'),
            ),
          ),
          const Row(
            children: [],
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
                onPressed: () {
                  print(_titleController.text);
                  print(_teacherController);
                  print(_courseController);
                },
                child: const Text('Save Class'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
