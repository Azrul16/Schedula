import 'package:flutter/material.dart';
import 'package:schedula/classmate_login.dart';
import 'package:schedula/login_page.dart';
import 'package:schedula/userAccounts/createUser.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    void startScreen() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const Login(),
        ),
      );
    }

    void classmateScreen() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const ClassmateLogin(),
        ),
      );
    }

    void createUserScreen() {
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
            child: Image.asset(
              'assets/images/appstore.png',
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: startScreen,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white, // Text color
                    minimumSize: const Size(double.infinity, 50), // Button size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Log In'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'OR',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Dont have an account?',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                TextButton(
                  onPressed: createUserScreen,
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ],
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
