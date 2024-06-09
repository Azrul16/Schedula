import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:schedula/models/models.dart';

class ClassItem extends StatelessWidget {
  const ClassItem(
    this.classSchedule, {
    super.key,
  });
  final ClassSchedule classSchedule;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow[300],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Text(
              DateFormat.jm().format(classSchedule.time),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  classSchedule.courseTitle,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  classSchedule.courseTecher,
                  style: GoogleFonts.lato(
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  classSchedule.courseCode,
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 9, 163, 22),
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              DateFormat('d MMMM, yyyy').format(classSchedule.date),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
