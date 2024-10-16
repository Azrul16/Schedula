import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_card/paper_card.dart';
import 'package:schedula/announsmentScreen/announce_model.dart';

class AnnounceItem extends StatelessWidget {
  const AnnounceItem({super.key, required this.announceItem});

  final Announcements announceItem;

  @override
  Widget build(BuildContext context) {
    return PaperCard(
      backgroundColor: Colors.purple[300],
      borderRadius: 20,
      elevation: 3,
      borderColor: Colors.blue[500],
      borderThickness: 10,
      textureOpacity: 2,
      margin: const EdgeInsets.all(5),
      textureFit: BoxFit.cover,
      texture: true,
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Text(
                  announceItem.title,
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Text(
                  announceItem.description,
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          (announceItem.downloadURL.isEmpty)
              ? const Text("No download File")
              : Row(
                  children: [
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.download),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
