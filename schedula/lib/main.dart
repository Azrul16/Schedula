import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:schedula/chatAI/chat_controller.dart';
import 'package:schedula/firebase_options.dart';
import 'package:schedula/utils/auth_gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await dotenv.load(fileName: ".env");
  InitializeController().init();
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
