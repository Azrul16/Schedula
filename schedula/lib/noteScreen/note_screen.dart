import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  void _onAddNotesOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return const Text('Hello, Welcome to new notes');
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
        actions: [
          IconButton(
            onPressed: _onAddNotesOverlay,
            icon: const Icon(
              Icons.add_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
