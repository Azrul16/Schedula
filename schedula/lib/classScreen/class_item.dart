import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:paper_card/paper_card.dart';
import 'package:schedula/classScreen/class_models.dart';

class ClassItem extends StatelessWidget {
  const ClassItem(
    this.classSchedule, {
    required this.docID,
    super.key,
  });
  final ClassSchedule classSchedule;
  final String docID;

  Future<void> delete() async {
    try {
      await FirebaseFirestore.instance
          .collection('claases')
          .doc(docID)
          .delete();
    } catch (error) {
      print('Error deleting class: $error');
    }
    print(docID);
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
                onPressed: delete,
                child: const Text('Delete'),
              ),
            ],
          );
        },
      );
    }

    return PaperCard(
      backgroundColor: Colors.amber[300],
      borderRadius: 20,
      elevation: 3,
      borderColor: Colors.orange[800],
      borderThickness: 10,
      textureOpacity: 2,
      margin: const EdgeInsets.all(5),
      textureFit: BoxFit.cover,
      texture: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  DateFormat.jm().format(classSchedule.time),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  DateFormat('d MMMM, yyyy').format(classSchedule.date),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  classSchedule.courseTitle,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
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
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    showDeleteDialog(context);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
