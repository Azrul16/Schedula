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
  bool _isPasswordVisible = false; // Password visibility state

  void _startScreen() async {
    try {
      showLoadingDialoge(context);
      await auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
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
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(30),
                child: SizedBox(
                  width: 10,
                  child: Image.asset('assets/images/appstore.png'),
                ),
              ),
              const SizedBox(height: 10),
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
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  controller: password,
                  obscureText: !_isPasswordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    label: const Text('Password'),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[900],
                  ),
                  onPressed: _startScreen,
                  autofocus: true,
                  child: Text(
                    'Login',
                    style: GoogleFonts.getFont('Lumanosimo',
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'OR',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.lato(
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: _createUserScreen,
                      child: Text(
                        "Create account",
                        style: GoogleFonts.lato(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.orange[900],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
