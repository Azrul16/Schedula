import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Announcementscreen extends StatelessWidget {
  const Announcementscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Announcements',
          style: GoogleFonts.getFont(
            'Lumanosimo',
            textStyle: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_outlined),
          ),
        ],
      ),
    );
  }
}
