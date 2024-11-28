import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schedula/userAccounts/user_model.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  Future<Map<String, dynamic>?> getUserData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return null;
    }
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

  @override
  Widget build(BuildContext context) {
    return const EditProfileScreen();
  }
}

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  Future<Map<String, dynamic>?> getUserData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return null;
    }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFF2196F3),
        title: const Text("Edit Profile"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2196F3), // Light blue (AppBar color)
              Color(0xFF1976D2), // Darker blue
            ],
          ),
        ),
        child: FutureBuilder<Map<String, dynamic>?>(
          future: getUserData(),
          builder: (BuildContext context,
              AsyncSnapshot<Map<String, dynamic>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: Text("Failed to load user data"));
            }

            Map<String, dynamic> userData = snapshot.data!;
            final user = UserModel.fromJson(userData);

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  ProfilePic(
                    image:
                        'https://st3.depositphotos.com/32927174/36182/v/450/depositphotos_361823194-stock-illustration-glowing-neon-line-create-account.jpg',
                    imageUploadBtnPress: () {
                      // Logic for uploading image
                    },
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        UserInfoEditField(
                          text: "Name",
                          child: _buildTextFormField(
                            initialValue: '${user.fname} ${user.lname}',
                            hintText: "Enter your full name",
                          ),
                        ),
                        const SizedBox(height: 10),
                        UserInfoEditField(
                          text: "ID",
                          child: _buildTextFormField(
                            initialValue: user.id,
                            hintText: "Enter your ID",
                          ),
                        ),
                        const SizedBox(height: 10),
                        UserInfoEditField(
                          text: "Registration",
                          child: _buildTextFormField(
                            initialValue: user.reg,
                            hintText: "Enter your registration number",
                          ),
                        ),
                        const SizedBox(height: 10),
                        UserInfoEditField(
                          text: "Email",
                          child: _buildTextFormField(
                            initialValue: user.email,
                            hintText: "Enter your email",
                          ),
                        ),
                        const SizedBox(height: 10),
                        UserInfoEditField(
                          text: "Phone",
                          child: _buildTextFormField(
                            initialValue: user.phoneNumber,
                            hintText: "Enter your phone number",
                          ),
                        ),
                        const SizedBox(height: 10),
                        UserInfoEditField(
                          text: "Department",
                          child: _buildTextFormField(
                            initialValue: user.dept,
                            hintText: "Enter your department",
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 30),
                              ),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Save Update logic
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2196F3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 30),
                              ),
                              child: const Text(
                                "Save",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String initialValue,
    required String hintText,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
    required this.image,
    this.imageUploadBtnPress,
  });

  final String image;
  final VoidCallback? imageUploadBtnPress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(image),
        ),
        InkWell(
          onTap: imageUploadBtnPress,
          child: const CircleAvatar(
            radius: 18,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class UserInfoEditField extends StatelessWidget {
  const UserInfoEditField({
    super.key,
    required this.text,
    required this.child,
  });

  final String text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        child,
      ],
    );
  }
}
