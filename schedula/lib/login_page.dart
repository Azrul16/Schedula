import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedula/userAccounts/createUser.dart';
import 'package:schedula/utils/all_dialouge.dart';
import 'package:schedula/utils/toast_message.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final auth = FirebaseAuth.instance;
  void _startScreen() async {
    try {
      showLoadingDialoge(context);
      await auth.signInWithEmailAndPassword(
          //UserCredential userCredential =
          email: email.text,
          password: password.text);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    } catch (e) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      showToastMessageWarning('Invalid email or password');
    }
  }

  void _createUserScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const CreateUser(),
      ),
    );
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        // appBar: AppBar(
        //   actions: const [
        //     Text(
        //       'Schedula',
        //     ),
        //   ],
        //   backgroundColor: Colors.orange,
        // ),
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: SizedBox(
                  width: 10,
                  child: Image.asset(
                    'assets/images/appstore.png',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  controller: email,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text('Email'),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    label: Text('Paassword'),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    'or',
                    style: GoogleFonts.getFont(
                      'Lumanosimo',
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  maxLength: 5,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Class Code'),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: ElevatedButton(
                  onPressed: _startScreen,
                  autofocus: true,
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
        ),
      ),
    );
  }
}
