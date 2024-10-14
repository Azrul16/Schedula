import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:schedula/noteScreen/note_item.dart';
import 'package:schedula/noteScreen/notes_model.dart';

class NotesList extends StatelessWidget {
  const NotesList({
    super.key,
    required selectedNote,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('notes').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final allClasses = snapshot.data?.docs;
        List<ClassNotes> newNotes = [];

        for (var e in allClasses!) {
          newNotes.add(ClassNotes.fromJSON(e.data(), e.id));
        }

        return ListView.builder(
          itemCount: allClasses.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            return NotesItem(
              newNotes[index],
              isStart: index == 0,
              isEnd: index == newNotes.length - 1,
              task: newNotes.length,
            );
          },
        );
      },
    );
  }
}
