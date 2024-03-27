import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
void FirstQuiz() {}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/appstore.png',
            width: 300,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Welcome to Schedula.',
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
          const SizedBox(
            height: 30,
          ),
          const ElevatedButton(
            style: ButtonStyle(
              foregroundColor: Colors.green,
            ),
            onPressed: FirstQuiz,
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
