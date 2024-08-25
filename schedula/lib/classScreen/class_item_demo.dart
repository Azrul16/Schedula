import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:schedula/classScreen/class_models.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ClassItemDemo extends StatelessWidget {
  const ClassItemDemo(
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
      axis: TimelineAxis.horizontal,
      alignment: TimelineAlign.manual,
      lineXY: 0.3,
      endChild: Container(
        constraints: const BoxConstraints(),
        color: Colors.lightGreenAccent,
      ),
      startChild: Container(
        color: Colors.amberAccent,
      ),
    );
  }
}
