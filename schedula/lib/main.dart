import 'package:flutter/material.dart';
import 'package:schedula/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orange,
                Colors.yellow,
              ],
            ),
          ),
          child: const StartScreen(),
        ),
      ),
    ),
  );
}
