import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text('Logout'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://avatar-prod-us-east-2.webexcontent.com/Avtr~V1~1eb65fdf-9643-417f-9974-ad72cae0e10f/V1~1a08968daf428f4f5d1ce0f04de95eb40bf8d6d8cb5a0463a6f858f52e3a9df9~49713ad2dabe4cb2a6f83a05c6d6e4f5"), // Replace with your profile image URL
            ),
            const SizedBox(height: 10),
            const Text(
              'Azrul Amaline',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              '@azrul16',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '71 Classmates',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('Log out'),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
