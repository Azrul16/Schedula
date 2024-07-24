import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedula/announsmentScreen/new_announcement.dart';

class Announcementscreen extends StatelessWidget {
  const Announcementscreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onAddAnnounceOverlay() {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewAnnouncement();
        },
      );
    }

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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAddAnnounceOverlay,
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
