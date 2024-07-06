import 'package:flutter/material.dart';
import 'package:schedula/screens/Schedule/start_screen.dart';
import 'package:schedula/userAccounts/createUser.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
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
      backgroundColor: Colors.amber,
      // appBar: AppBar(
      //   actions: const [
      //     Text(
      //       'Schedula',
      //     ),
      //   ],
      //   backgroundColor: Colors.orange,
      // ),
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
              maxLength: 5,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text('Registration no'),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 100),
            child: TextField(
              maxLength: 10,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text('Student ID no'),
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
            height: 10,
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
                'Create an Account',
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
