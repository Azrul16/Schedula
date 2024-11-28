import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateAssignmentBottomSheet extends StatefulWidget {
  const CreateAssignmentBottomSheet({super.key});

  @override
  State<CreateAssignmentBottomSheet> createState() =>
      _CreateAssignmentBottomSheetState();
}

class _CreateAssignmentBottomSheetState
    extends State<CreateAssignmentBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _assignmentNameController =
      TextEditingController();
  final TextEditingController _courseTitleController = TextEditingController();
  final TextEditingController _teacherNameController = TextEditingController();
  final TextEditingController _lastDateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(picked);
      setState(() {
        _lastDateController.text = formattedDate;
      });
    }
  }

  Future<void> _createAssignment() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance.collection('assignments').add({
          'assignmentName': _assignmentNameController.text,
          'courseTitle': _courseTitleController.text,
          'teacherName': _teacherNameController.text,
          'lastDate': _lastDateController.text,
        });
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Assignment created successfully!")),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to create assignment: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 20,
        left: 20,
        right: 20,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Create Assignment",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _assignmentNameController,
              decoration: const InputDecoration(
                labelText: "Assignment Name",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter assignment name";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _courseTitleController,
              decoration: const InputDecoration(
                labelText: "Course Title",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter course title";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _teacherNameController,
              decoration: const InputDecoration(
                labelText: "Teacher Name",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter teacher name";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _lastDateController,
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: const InputDecoration(
                labelText: "Last Date (DD/MM/YYYY)",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please select a last date";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _createAssignment,
              child: const Text("Create Assignment"),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
