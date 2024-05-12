import 'package:flutter/material.dart';
import 'package:schedula/models/models.dart';
import 'package:schedula/screens/Schedule/class_item.dart';

class ClassList extends StatelessWidget {
  const ClassList({
    super.key,
    required this.selectedSchedule,
  });

  final List<ClassSchedule> selectedSchedule;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: selectedSchedule.length,
      itemBuilder: (ctx, index) => ClassItem(
        selectedSchedule[index],
      ),
    );
  }
}
