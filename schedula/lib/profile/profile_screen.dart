import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schedula/profile/classmate/classmate_screen.dart';
import 'package:schedula/profile/total_class/total_class_screen.dart';
import 'package:schedula/userAccounts/user_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<Map<String, dynamic>?> getUserData() async {
    // Get the currently logged-in user
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      // User is not logged in
      return null;
    }

    String currentEmail = currentUser.email!;

    // Query the Firestore users collection
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();

    for (var doc in querySnapshot.docs) {
      if (doc['email'] == currentEmail) {
        return doc.data()
            as Map<String, dynamic>; // Return all fields of the matching user
      }
    }

    return null; // No matching user found
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: getUserData(),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            Map<String, dynamic> userData = snapshot.data!;
            final user = UserModel.fromJson(userData);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile image and name
                    const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                        "https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg",
                      ), // Replace with your image path
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      '${user.fname} ${user.lname}',
                      style: const TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                        '@${user.fname.toLowerCase()}_${user.lname.toLowerCase()}'),
                    const SizedBox(height: 16.0),
                    // Edit Profile button
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    // Menu items
                    ListTile(
                      leading: const Icon(Icons.payment),
                      title: const Text('Profile Details'),
                      onTap: () {
                        // Handle Profile Details tap
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.group),
                      title: const Text('Classmates'),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ClassmateScreen(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.class_),
                      title: const Text('Total classes'),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const TotalClassScreen(),
                          ),
                        );
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
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w500),
                      ),
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
