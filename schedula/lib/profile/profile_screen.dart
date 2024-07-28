import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile image and name
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                  "https://avatar-prod-us-east-2.webexcontent.com/Avtr~V1~1eb65fdf-9643-417f-9974-ad72cae0e10f/V1~1a08968daf428f4f5d1ce0f04de95eb40bf8d6d8cb5a0463a6f858f52e3a9df9~49713ad2dabe4cb2a6f83a05c6d6e4f5",
                ), // Replace with your image path
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Azrul Amaline',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const Text('@azrul_amaline'),
              const SizedBox(height: 16.0),
              // Edit Profile button
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 32.0),
              // Menu items

              ListTile(
                leading: const Icon(Icons.payment),
                title: const Text('Profile Details'),
                onTap: () {
                  // Handle Billing Details tap
                },
              ),
              ListTile(
                leading: const Icon(Icons.group),
                title: const Text('Classmates'),
                onTap: () {
                  // Handle User Management tap
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Information'),
                onTap: () {
                  // Handle Information tap
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(
                  'Log out',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
