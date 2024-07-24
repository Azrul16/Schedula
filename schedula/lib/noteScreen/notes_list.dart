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
        return ListView.builder(
          itemCount: allClasses?.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            final newNotes = ClassNotes.fromJSON(allClasses![index].data());

            return NotesItem(
              notesItem: newNotes,
            );
          },
        );
      },
    );
  }
}
