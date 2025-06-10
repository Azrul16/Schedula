import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schedula/announsmentScreen/announcement_screen.dart';
import 'package:schedula/assignments/assignment_screen.dart';
import 'package:schedula/chatAI/chat_screen.dart';
import 'package:schedula/noteScreen/note_screen.dart';
import 'package:schedula/profile/profile_screen.dart';
import 'package:schedula/classScreen/class_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  late List<Widget> _pages;
  Map<String, dynamic>? _userData;

  Future<void> _initializeUserData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      String currentEmail = currentUser.email!;
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      for (var doc in querySnapshot.docs) {
        if (doc['email'] == currentEmail) {
          setState(() {
            _userData = doc.data() as Map<String, dynamic>;
            _pages = [
              const ClassScren(),
              NoteScreen(
                currentUserId: currentUser.uid,
                semester: _userData?['semister'] ?? '',
                isCaptain: _userData?['isCaptain'] ?? false,
              ),
              const AssignmentsPage(),
              ChatScreen(),
              const ProfileScreen(),
            ];
          });
          break;
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    requesPermission();
    _pages = [
      const ClassScren(),
      const Center(
          child: CircularProgressIndicator()), // Placeholder while loading
      const AssignmentsPage(),
      ChatScreen(),
      const ProfileScreen(),
    ];
    _initializeUserData();
  }

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  Future<void> requesPermission() async {
    // ignore: unused_local_variable
    final notificationSettings =
        await FirebaseMessaging.instance.requestPermission(provisional: true);

// For apple platforms, ensure the APNS token is available before making any FCM plugin API calls
    final apnsToken = await FirebaseMessaging.instance.getToken();
    if (apnsToken != null) {
      print(apnsToken);
      print('-----------------');
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.today_outlined),
            label: 'Classes',
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Notes',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.campaign),
            label: 'Assignments',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        onTap: onTappedBar,
      ),
    );
  }
}


// _pageController.animateToPage(_currentIndex,
//               duration: const Duration(milliseconds: 400),
//               curve: Curves.easeOutQuad);