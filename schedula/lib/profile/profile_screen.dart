import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schedula/profile/classmate/classmate_screen.dart';
import 'package:schedula/profile/profile_details/profile_details.dart';
import 'package:schedula/profile/profile_menu.dart';
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

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to Logout?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
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
                        "https://st3.depositphotos.com/32927174/36182/v/450/depositphotos_361823194-stock-illustration-glowing-neon-line-create-account.jpg",
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
                    const SizedBox(height: 32.0),
                    ProfileMenu(
                      text: "Profile Details",
                      icon: Icons.person_2_rounded,
                      press: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ProfileDetails(),
                          ),
                        );
                      },
                    ),
                    ProfileMenu(
                      text: "Classmates",
                      icon: Icons.group_rounded,
                      press: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ClassmateScreen(),
                          ),
                        );
                      },
                    ),
                    ProfileMenu(
                      text: "Total classes",
                      icon: Icons.class_rounded,
                      press: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const TotalClass(),
                          ),
                        );
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFFFF7643),
                          padding: const EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          backgroundColor: Colors.red[400],
                        ),
                        onPressed: () {
                          showLogoutDialog(context);
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.logout),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                "Logout",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
