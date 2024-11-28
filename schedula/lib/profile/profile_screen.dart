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
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return null;

    String currentEmail = currentUser.email!;
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();

    for (var doc in querySnapshot.docs) {
      if (doc['email'] == currentEmail) {
        return doc.data() as Map<String, dynamic>;
      }
    }
    return null;
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
                Navigator.of(context).pop();
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
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4CAF50), Color(0xFF2196F3)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          FutureBuilder<Map<String, dynamic>?>(
            future: getUserData(),
            builder: (BuildContext context,
                AsyncSnapshot<Map<String, dynamic>?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data == null) {
                return const Center(child: Text('User data not found.'));
              }

              Map<String, dynamic> userData = snapshot.data!;
              final user = UserModel.fromJson(userData);

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      // Profile Picture
                      Center(
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 65,
                            backgroundImage: const NetworkImage(
                              "https://st3.depositphotos.com/32927174/36182/v/450/depositphotos_361823194-stock-illustration-glowing-neon-line-create-account.jpg",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // User Information
                      Text(
                        '${user.fname} ${user.lname}',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '@${user.fname.toLowerCase()}_${user.lname.toLowerCase()}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Menu Items
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
                        text: "Total Classes",
                        icon: Icons.class_rounded,
                        press: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => const TotalClass(),
                            ),
                          );
                        },
                      ),
                      // Logout Button
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          showLogoutDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[400],
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 40,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        icon: const Icon(Icons.logout, color: Colors.white),
                        label: const Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
