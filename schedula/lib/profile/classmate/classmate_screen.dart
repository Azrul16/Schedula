import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedula/profile/classmate/classmate_list.dart';

class ClassmateScreen extends StatelessWidget {
  const ClassmateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Classmates',
          style: GoogleFonts.getFont('Belanosima',
              textStyle: const TextStyle(
                fontSize: 20,
              )),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ClassmateList(),
          ],
        ),
      ),
    );
  }
}
