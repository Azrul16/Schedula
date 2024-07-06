// ignore: file_names
import 'package:flutter/material.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() {
    return _CreateUser();
  }
}

class _CreateUser extends State<CreateUser> {
  final List<String> semester = [
    '1st',
    '2nd',
    '3rd',
    '4th',
    '5th',
    '6th',
    '7th',
    '8th'
  ];
  String selectedSmester = '1st'; // Default selected value
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
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
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Image.asset('assets/images/appstore.png'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                maxLength: 20,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(label: Text('First Name')),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                maxLength: 20,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(label: Text('Last Name')),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                maxLength: 20,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(label: Text('Name of Department')),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                maxLength: 20,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(label: Text('Name of University')),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                maxLength: 20,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(label: Text('Email')),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                maxLength: 20,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(label: Text('Password')),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                maxLength: 20,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(label: Text('Confirm Password')),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Create'),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
