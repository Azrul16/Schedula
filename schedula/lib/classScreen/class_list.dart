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
      stream: FirebaseFirestore.instance
          .collection('classes')
          .orderBy('time')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final allClasses = snapshot.data?.docs;
        List<ClassSchedule> allClassesinModel = [];

        for (var e in allClasses!) {
          allClassesinModel.add(ClassSchedule.fromJSON(e.data(), e.id));
        }

        List<ClassSchedule> todaysClass = [];

        for (var element in allClassesinModel) {
          if (element.time.day >= DateTime.now().day) {
            todaysClass.add(element);
          }
        }
        if (todaysClass.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/no_class.jpg'),
            ],
          );
        } else {
          return ListView.builder(
            itemCount: todaysClass.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) {
              return ClassItem(
                todaysClass[index],
                isStart: index == 0,
                isEnd: index == todaysClass.length - 1,
                task: todaysClass.length,
              );
            },
          );
        }
      },
    );
  }
}
