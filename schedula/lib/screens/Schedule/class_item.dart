import 'package:flutter/material.dart';
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Text(classSchedule.courseTitle),
      ),
    );
  }
}
