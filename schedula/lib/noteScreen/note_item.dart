import 'package:flutter/material.dart';
import 'package:paper_card/paper_card.dart';
import 'package:schedula/noteScreen/notes_model.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.notesItem});

  final ClassNotes notesItem;

  @override
  Widget build(BuildContext context) {
    return PaperCard(
      child: Column(
        children: [
          Text(notesItem.courseTitle),
          Text(notesItem.courseTitle),
          Text(notesItem.downloadURL),
        ],
      ),
    );
  }
}
