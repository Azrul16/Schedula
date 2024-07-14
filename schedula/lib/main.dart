import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:schedula/firebase_options.dart';
import 'package:schedula/utils/auth_gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MaterialApp(
      // home: Login(),
      home: AuthGate(),
      // home: NoteScreen(),
      // home: ClassmateLogin(),
      // home: CreateUser(),
    ),
  );
}
