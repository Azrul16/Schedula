import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedula/classScreen/class_models.dart';
import 'package:schedula/classScreen/class_list.dart';
import 'package:schedula/classScreen/new_class.dart';

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
    DateTime now = DateTime.now();
    List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    List<DateTime> weekDates = List.generate(7, (index) {
      return now.subtract(Duration(days: now.weekday - 1 - index));
    });

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
        decoration: const BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Today',
                style: GoogleFonts.getFont(
                  'Caprasimo',
                  fontSize: 26,
                  color: Colors.green,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  7,
                  (index) {
                    bool isToday = weekDates[index].day == now.day &&
                        weekDates[index].month == now.month;
                    return Column(
                      children: [
                        Text(
                          weekdays[index],
                          style: TextStyle(
                            fontWeight:
                                isToday ? FontWeight.bold : FontWeight.normal,
                            color: isToday ? Colors.green : Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          weekDates[index].day.toString(),
                          style: TextStyle(
                            fontWeight:
                                isToday ? FontWeight.bold : FontWeight.normal,
                            color: isToday ? Colors.green : Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        if (isToday)
                          Container(
                            margin: const EdgeInsets.only(top: 2),
                            height: 2,
                            width: 20,
                            color: Colors.green,
                          ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
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
