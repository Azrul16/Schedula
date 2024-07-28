import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_card/paper_card.dart';
import 'package:schedula/noteScreen/notes_model.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.notesItem});

  final ClassNotes notesItem;

  @override
  Widget build(BuildContext context) {
    return PaperCard(
      backgroundColor: Colors.green,
      borderRadius: 20,
      elevation: 3,
      borderColor: Colors.red[500],
      borderThickness: 10,
      textureOpacity: 2,
      margin: const EdgeInsets.all(5),
      textureFit: BoxFit.cover,
      texture: true,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Text(
              notesItem.courseTitle,
              style: GoogleFonts.getFont(
                'Lumanosimo',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Text(
              notesItem.courseTitle,
              style: GoogleFonts.getFont(
                'Lumanosimo',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Text(notesItem.downloadURL),
          ),
        ],
      ),
    );
  }
}
