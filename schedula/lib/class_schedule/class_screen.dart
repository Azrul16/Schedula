import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedula/class_schedule/class_models.dart';
import 'package:schedula/class_schedule/class_list.dart';
import 'package:schedula/class_schedule/new_class.dart';

class ClassScren extends StatefulWidget {
  const ClassScren({super.key});

  @override
  State<ClassScren> createState() => _ClassScrenState();
}

class _ClassScrenState extends State<ClassScren> {
  final List<ClassSchedule> _selectedSchedule = [];

  void _openAddClassOverlay() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return NewClass(
            onAddClass: _addClass,
          );
        });
  }

  void _addClass(ClassSchedule classSchedule) {
    setState(() {
      _selectedSchedule.add(classSchedule);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        title: GestureDetector(
          onTap: () {
            //FirebaseAuth.instance.signOut();
          },
          child: Text(
            'Classes',
            style: GoogleFonts.getFont(
              'Lumanosimo',
              textStyle: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/class_background.jpg'), // Replace with your image asset path
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Classes are more Important than sleep',
                style: GoogleFonts.getFont(
                  'Kalnia',
                  textStyle: const TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ClassList(selectedSchedule: _selectedSchedule),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddClassOverlay,
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
