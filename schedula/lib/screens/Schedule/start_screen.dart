import 'package:flutter/material.dart';
import 'package:schedula/models/models.dart';
import 'package:schedula/screens/Schedule/class_list.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final List<ClassSchedule> _selectedSchedule = [
    ClassSchedule(
      courseTitle: 'Numerical',
      courseTecher: Category.Sobuj_sir,
      date: DateTime.now(),
      time: DateTime.now(),
      courseCode: 'CIT-312',
    ),
    ClassSchedule(
      courseTitle: 'Networking',
      courseTecher: Category.Sobuj_sir,
      date: DateTime.now(),
      time: DateTime.now(),
      courseCode: 'CIT-313',
    ),
    ClassSchedule(
      courseTitle: 'MicroProcessor',
      courseTecher: Category.Mahabub_sir,
      date: DateTime.now(),
      time: DateTime.now(),
      courseCode: 'CCE-312',
    )
  ];
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Schedula'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      backgroundColor: Colors.amber[900],
      body: Center(
        child: Row(
          children: [
            Column(
              children: [
                const Text('Welcome to CSE Faculty of PSTU'),
                SizedBox(
                  width: 400,
                  height: 300,
                  child: ClassList(selectedSchedule: _selectedSchedule),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
