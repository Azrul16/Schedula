import 'package:flutter/material.dart';

class NewClass extends StatefulWidget {
  const NewClass({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NewClassState();
  }
}

class _NewClassState extends State<NewClass> {
  void _saveTitleInput(String inputValue) {}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            onChanged: _saveTitleInput,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Course Title'),
            ),
          ),
          TextField(
            maxLength: 30,
            decoration: InputDecoration(
              label: Text("Teacher's name"),
            ),
          ),
          TextField(
            maxLength: 7,
            decoration: InputDecoration(
              label: Text('Course Code'),
            ),
          ),
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}
