import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedula/announsmentScreen/announce_list.dart';
import 'package:schedula/announsmentScreen/announce_model.dart';
import 'package:schedula/announsmentScreen/new_announcement.dart';

class Announcementscreen extends StatefulWidget {
  const Announcementscreen({super.key});

  @override
  State<Announcementscreen> createState() => _AnnouncementscreenState();
}

class _AnnouncementscreenState extends State<Announcementscreen> {
  @override
  Widget build(BuildContext context) {
    final List<Announcements> selectedAnnounce = [];
    void onAddAnnounceOverlay() {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return const NewAnnouncement();
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
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(),
        child: SingleChildScrollView(
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
            AnnounceList(
              selectedAnnounce: selectedAnnounce,
            )
          ],
        )),
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
