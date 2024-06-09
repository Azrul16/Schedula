import 'package:flutter/material.dart';
import 'package:schedula/models/models.dart';
import 'package:schedula/screens/Schedule/class_list.dart';
import 'package:schedula/screens/new_class.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int selectedIndex = 0;
  final List<ClassSchedule> _selectedSchedule = [
    ClassSchedule(
      courseTitle: 'Numerical',
      courseTecher: "Murad Sir",
      date: DateTime.now(),
      time: DateTime.now(),
      courseCode: 'CIT-312',
    ),
    ClassSchedule(
      courseTitle: 'Networking',
      courseTecher: "Samsuzzaman Sabuz sir",
      date: DateTime.now(),
      time: DateTime.now(),
      courseCode: 'CIT-313',
    ),
    ClassSchedule(
      courseTitle: 'Micro Processor',
      courseTecher: "Mahbub sir",
      date: DateTime.now(),
      time: DateTime.now(),
      courseCode: 'CCE-312',
    )
  ];

  void _openAddClassOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return const NewClass();
        });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 53, 194, 236),
        title: const Text('Schedula'),
        actions: [
          IconButton(
            onPressed: _openAddClassOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 12, 43, 53),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Welcome to CSE Faculty of PSTU'),
              ClassList(selectedSchedule: _selectedSchedule),
            ],
          ),
        ),
      ),
      bottomNavigationBar: WaterDropNavBar(
        backgroundColor: const Color.fromARGB(255, 179, 225, 240),
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
          // pageController.animateToPage(selectedIndex,
          //     duration: const Duration(milliseconds: 400),
          //     curve: Curves.easeOutQuad);
        },
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            filledIcon: Icons.home,
            outlinedIcon: Icons.home_outlined,
          ),
          BarItem(filledIcon: Icons.note, outlinedIcon: Icons.note_outlined),
          BarItem(
              filledIcon: Icons.assignment,
              outlinedIcon: Icons.assignment_outlined),
          BarItem(
              filledIcon: Icons.comment, outlinedIcon: Icons.comment_outlined),
        ],
      ),
    );
  }
}
