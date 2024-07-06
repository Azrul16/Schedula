import 'package:flutter/material.dart';
import 'package:schedula/classmate_login.dart';
import 'package:schedula/login_page.dart';
import 'package:schedula/userAccounts/createUser.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    void _startScreen() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const Login(),
        ),
      );
    }

    void _classmateScreen() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const ClassmateLogin(),
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
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: _startScreen,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 226, 110, 2),
                  ),
                  child: const Text(
                    'Login as a CR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: _classmateScreen,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 226, 110, 2),
                  ),
                  child: const Text(
                    'Login as a Classmate',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'OR',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: TextButton(
              onPressed: _createUserScreen,
              child: const Text(
                'Register as a CR',
                style: TextStyle(
                  fontSize: 20,
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
