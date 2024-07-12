import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schedula/models/models.dart';

class NewClass extends StatefulWidget {
  const NewClass({super.key, required this.onAddClass});

  final void Function(ClassSchedule classSchedule) onAddClass;
  @override
  State<StatefulWidget> createState() {
    return _NewClassState();
  }
}

class _NewClassState extends State<NewClass> {
  final _titleController = TextEditingController();
  final _teacherController = TextEditingController();
  final _courseController = TextEditingController();
  DateTime? _selectedDate;
  DateTime? _selectedTime;

  DateTime convertToDateTime(TimeOfDay timeOfDay) {
    DateTime now = DateTime.now();
    DateTime dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );

    return dateTime;
  }

  void _timePicker() async {
    final TimeOfDay initialTime = TimeOfDay.now();
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    setState(() {
      _selectedTime = convertToDateTime(pickedTime!);
    });
  }

  void _datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year, now.month, now.day);
    final lastDate = DateTime(now.year, now.month + 7, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitClassDate() async {
    if (_titleController.text.trim().isEmpty ||
        _selectedDate == null ||
        _selectedTime == null ||
        _teacherController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
              'Please make sure that you have entered value to all field.'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Okey'))
          ],
        ),
      );
    }
    widget.onAddClass(
      ClassSchedule(
        courseTitle: _titleController.text,
        courseTecher: _teacherController.text,
        date: _selectedDate!,
        time: _selectedTime!,
        courseCode: _courseController.text,
      ),
    );
    final thisClass = ClassSchedule(
      courseTitle: _titleController.text,
      courseTecher: _teacherController.text,
      date: _selectedDate!,
      time: _selectedTime!,
      courseCode: _courseController.text,
    );
    thisClass.toJSON();

    await FirebaseFirestore.instance
        .collection('classes')
        .add(thisClass.toJSON());
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

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
          const SizedBox(
            height: 60,
          ),
          TextField(
            controller: _titleController,
            maxLength: 25,
            decoration: const InputDecoration(
              label: Text('Course Title'),
            ),
          ),
          TextField(
            controller: _teacherController,
            maxLength: 20,
            decoration: const InputDecoration(
              label: Text("Teacher's name"),
            ),
          ),
          TextField(
            controller: _courseController,
            maxLength: 8,
            decoration: const InputDecoration(
              label: Text('Course Code'),
            ),
          ),
          Row(
            children: [
              Text(
                _selectedTime == null
                    ? 'Select Class Time'
                    : DateFormat.jm().format(_selectedTime!),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              IconButton(
                onPressed: _timePicker,
                icon: const Icon(Icons.timer),
              ),
              const Spacer(),
              Text(
                _selectedDate == null
                    ? "Select a Date"
                    : DateFormat('d MMMM, yyyy').format(_selectedDate!),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              IconButton(
                onPressed: _datePicker,
                icon: const Icon(Icons.calendar_month),
              )
            ],
          ),
          const SizedBox(
            height: 10,
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
                  _submitClassDate();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Save Class',
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
