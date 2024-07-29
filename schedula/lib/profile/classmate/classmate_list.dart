import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_card/paper_card.dart';

class ClassmateList extends StatelessWidget {
  const ClassmateList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final allusers = snapshot.data?.docs;

        return ListView.builder(
          itemCount: allusers!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final DocumentSnapshot document = allusers[index];
            return PaperCard(
                backgroundColor: Colors.white,
                borderRadius: 20,
                elevation: 3,
                borderColor: Colors.black,
                borderThickness: 10,
                textureOpacity: 2,
                margin: const EdgeInsets.all(5),
                textureFit: BoxFit.cover,
                texture: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      document['fname'] + ' ' + document['lname'],
                      style: GoogleFonts.getFont(
                        'Martian Mono',
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          document['email'],
                          style: GoogleFonts.getFont(
                            'Martian Mono',
                            textStyle: const TextStyle(fontSize: 14),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.mail),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          document['phoneNumber'],
                          style: GoogleFonts.getFont(
                            'Martian Mono',
                            textStyle: const TextStyle(fontSize: 14),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () async {
                            await FlutterPhoneDirectCaller.callNumber(
                                document['phoneNumber']);
                          },
                          icon: const Icon(Icons.call),
                        ),
                      ],
                    ),
                  ],
                ));
          },
        );
      },
    );
  }
}
