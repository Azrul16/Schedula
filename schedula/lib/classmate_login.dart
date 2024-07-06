import 'package:flutter/material.dart';
import 'package:schedula/screens/Schedule/start_screen.dart';
import 'package:schedula/userAccounts/createUser.dart';

class ClassmateLogin extends StatefulWidget {
  const ClassmateLogin({super.key});

  @override
  State<ClassmateLogin> createState() {
    return _ClassmateLoginState();
  }
}

class _ClassmateLoginState extends State<ClassmateLogin> {
  void _startScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const StartScreen(),
      ),
    );
  }

  void _createUserScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const CreateUser(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Image.asset('assets/images/appstore.png'),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 100),
            child: TextField(
              maxLength: 10,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Class Coupn'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150),
            child: ElevatedButton(
              onPressed: _startScreen,
              child: const Text('Login'),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'OR',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: TextButton(
              onPressed: _createUserScreen,
              child: const Text(
                'Register as a CR',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
