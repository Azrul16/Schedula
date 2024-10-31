import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schedula/userAccounts/login_page.dart';

import 'package:schedula/classScreen/start_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const Login();
        }
        return const StartScreen();
      },
    );
  }
}

Future<String?> checkUserAuthAndGetSemester() async {
  try {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists && userDoc.data() != null) {
        var userData = userDoc.data() as Map<String, dynamic>;
        String? semester = userData['semister'];

        if (semester != null) {
          print(semester);
          return semester;
        } else {
          print("Semester field is missing in user's document.");
          return null;
        }
      } else {
        print("User document does not exist.");
        return null;
      }
    } else {
      print("User is not logged in.");
      return null;
    }
  } catch (e) {
    print("Error: $e");
    return null;
  }
}
