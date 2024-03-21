import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.deepOrangeAccent,
              Colors.yellowAccent,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        ),
      ),
    ),
  );
}
