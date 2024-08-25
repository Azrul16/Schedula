import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:paper_card/paper_card.dart';
import 'package:schedula/classScreen/class_models.dart';
import 'package:schedula/classScreen/update_class.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ClassItem extends StatelessWidget {
  const ClassItem(
    this.classSchedule, {
    super.key,
  });
  final ClassSchedule classSchedule;

  Future<void> delete() async {
    try {
      await FirebaseFirestore.instance
          .collection('classes')
          .doc(classSchedule.docID)
          .delete();
    } catch (error) {
      print('Error deleting class: $error');
    }
    print(classSchedule.docID);
  }

  @override
  Widget build(BuildContext context) {
    void showDeleteDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete'),
            content: const Text('Are you sure you want to delete this class?'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
              TextButton(
                onPressed: () async {
                  await delete();
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Delete'),
              ),
            ],
          );
        },
      );
    }

    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.2, // Adjust this value to control the alignment
      isFirst: true,
      isLast: false,
      beforeLineStyle: LineStyle(color: Colors.blue.shade200, thickness: 2),
      indicatorStyle: IndicatorStyle(
        width: 20,
        color: Colors.blue.shade400,
        padding: const EdgeInsets.all(6),
      ),
      endChild: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      classSchedule.courseTitle,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(classSchedule.courseTecher),
                    const SizedBox(height: 5),
                    Text(classSchedule.courseCode),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      startChild: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('hh:mm').format(classSchedule.time),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              DateFormat('d MMM').format(classSchedule.time),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
