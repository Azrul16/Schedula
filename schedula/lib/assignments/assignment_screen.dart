import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:schedula/assignments/assignment_bottom_sheet.dart';
import 'assignment_card.dart';
import 'package:intl/intl.dart';

class AssignmentsPage extends StatelessWidget {
  const AssignmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignments"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('assignments').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No Assignments Found"));
          }

          // Filter assignments where the last date has not passed
          final currentDate = DateTime.now();
          List<QueryDocumentSnapshot> validAssignments =
              snapshot.data!.docs.where((doc) {
            final Map<String, dynamic> assignment =
                doc.data() as Map<String, dynamic>;
            final lastDate = assignment['lastDate'];
            try {
              // Parse the date in DD/MM/yyyy format
              final parsedLastDate = DateFormat('dd/MM/yyyy').parse(lastDate);
              return parsedLastDate.isAfter(currentDate) ||
                  parsedLastDate.isAtSameMomentAs(currentDate);
            } catch (e) {
              return false; // Skip if date parsing fails
            }
          }).toList();

          if (validAssignments.isEmpty) {
            return const Center(child: Text("No Upcoming Assignments"));
          }

          return ListView.builder(
            itemCount: validAssignments.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> assignment =
                  validAssignments[index].data() as Map<String, dynamic>;

              return AssignmentCard(
                assignmentName: assignment['assignmentName'],
                courseTitle: assignment['courseTitle'],
                teacherName: assignment['teacherName'],
                lastDate: assignment['lastDate'],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => const CreateAssignmentBottomSheet(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
