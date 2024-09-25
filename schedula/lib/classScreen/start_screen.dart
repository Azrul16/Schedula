import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:schedula/announsmentScreen/announcement_screen.dart';
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

  final List<Widget> _pages = [
    const ClassScren(),
    const NoteScreen(),
    const Announcementscreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requesPermission();
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
            label: 'Announcement',
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