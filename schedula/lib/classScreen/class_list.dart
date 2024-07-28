import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:schedula/classScreen/class_models.dart';
import 'package:schedula/classScreen/class_item.dart';

class ClassList extends StatelessWidget {
  const ClassList({
    super.key,
    required this.selectedSchedule,
  });

  final List<ClassSchedule> selectedSchedule;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('classes').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final allClasses = snapshot.data?.docs;
        return ListView.builder(
          itemCount: allClasses?.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            final newClass = ClassSchedule.fromJSON(allClasses![index].data());
            final docID = allClasses[index].id;

            return ClassItem(
              newClass,
              docID: docID,
            );
          },
        );
      },
    );
  }
}
