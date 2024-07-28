// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schedula/userAccounts/user_model.dart';
import 'package:schedula/utils/all_dialouge.dart';
import 'package:schedula/utils/toast_message.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() {
    return _CreateUser();
  }
}

class _CreateUser extends State<CreateUser> {
  final List<String> semester = Semester.values.map((e) => e.name).toList();
  String selectedSmester = Semester.First.name; // Default selected value

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController dept = TextEditingController();
  TextEditingController varsity = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 229, 189),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        title: const Text(
          'Create New User',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Image.asset('assets/images/appstore.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    }
                    return 'Please enter your first name';
                  },
                  controller: firstName,
                  maxLength: 20,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(label: Text('First Name')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    }
                    return 'Please enter your last name';
                  },
                  controller: lastName,
                  maxLength: 20,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(label: Text('Last Name')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    const Text(
                      'Select Your Semester.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    DropdownButton<String>(
                      value: selectedSmester,
                      items: semester.map((String flavor) {
                        return DropdownMenuItem<String>(
                          value: flavor,
                          child: Text(flavor),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          // Update selected value
                          selectedSmester = newValue;
                          setState(() {});
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: dept,
                  maxLength: 20,
                  keyboardType: TextInputType.text,
                  decoration:
                      const InputDecoration(label: Text('Name of Department')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: varsity,
                  maxLength: 20,
                  keyboardType: TextInputType.text,
                  decoration:
                      const InputDecoration(label: Text('Name of University')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: phoneNumber,
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(label: Text('Phone Number')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value!.contains('@')) {
                      return null;
                    }
                    return 'Please enter a valid email';
                  },
                  controller: email,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(label: Text('Email')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  obscureText: true,
                  controller: password,
                  maxLength: 20,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(label: Text('Password')),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  '[Password must contain at least one special characters and one number.]',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.end,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  validator: (value) {
                    if (password.text == value) {
                      return null;
                    }
                    return 'Confirm Password does not match';
                  },
                  obscureText: true,
                  controller: cpassword,
                  maxLength: 20,
                  keyboardType: TextInputType.text,
                  decoration:
                      const InputDecoration(label: Text('Confirm Password')),
                ),
              ),
              ElevatedButton(
                onPressed: createAccount,
                child: const Text('Create'),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> createAccount() async {
    if (formKey.currentState!.validate()) {
      showLoadingDialoge(context);
      UserModel userData = UserModel(
          lname: lastName.text,
          dept: dept.text,
          varsity: varsity.text,
          fname: firstName.text,
          phoneNumber: phoneNumber.text,
          semister:
              Semester.values.firstWhere((e) => e.name == selectedSmester),
          email: email.text);
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text);

      final userID = userCredential.user!.uid;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .set(userData.toJson());

      Navigator.of(context).pop();

      showToastMessageNormal('Account creation successful');
    }
  }
}
