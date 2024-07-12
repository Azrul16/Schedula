import 'package:flutter/material.dart';
import 'package:schedula/announsmentScreen/announcementScreen.dart';
import 'package:schedula/chatAI/chatAI.dart';
import 'package:schedula/noteScreen/note_screen.dart';
import 'package:schedula/screens/Schedule/class_screen.dart';

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
    const ChatAI()
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
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
            icon: Icon(Icons.ballot_outlined),
            label: 'Classes',
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Notes',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Announcement',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
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