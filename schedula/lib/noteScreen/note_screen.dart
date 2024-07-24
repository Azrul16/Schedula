import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedula/noteScreen/new_note.dart';
import 'package:schedula/noteScreen/notes_list.dart';
import 'package:schedula/noteScreen/notes_model.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({
    super.key,
  });

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final List<ClassNotes> selectedNote = [];

  void _onAddNotesOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return const NewNote();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes',
          style: GoogleFonts.getFont(
            'Lumanosimo',
            textStyle: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'The more you read,\n the more you learn',
              style: GoogleFonts.getFont(
                'Lumanosimo',
                textStyle: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            NotesList(selectedNote: selectedNote)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAddNotesOverlay,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
