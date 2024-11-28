import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassmateList extends StatelessWidget {
  const ClassmateList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }

        final allusers = snapshot.data?.docs;

        return ListView.builder(
          itemCount: allusers!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final DocumentSnapshot document = allusers[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.withOpacity(0.2),
                    Colors.green.withOpacity(0.2),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                  color: Colors.blue.shade900,
                  width: 1.5,
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${document['fname']} ${document['lname']}",
                    style: GoogleFonts.getFont(
                      'Martian Mono',
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'ID: ${document['ID']}',
                    style: GoogleFonts.getFont(
                      'Martian Mono',
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Reg: ${document['Registration']}',
                    style: GoogleFonts.getFont(
                      'Martian Mono',
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          document['email'],
                          style: GoogleFonts.getFont(
                            'Martian Mono',
                            textStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.blue.shade900,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Add email functionality
                        },
                        icon: const Icon(
                          Icons.mail,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          document['phoneNumber'],
                          style: GoogleFonts.getFont(
                            'Martian Mono',
                            textStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.green.shade900,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await FlutterPhoneDirectCaller.callNumber(
                              document['phoneNumber']);
                        },
                        icon: const Icon(
                          Icons.call,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
