import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_astro/screen/call_screen.dart';
import 'package:my_astro/screen/chat_screen.dart';
import 'package:my_astro/screen/home_screen.dart';
import 'package:my_astro/screen/remedies/remedies_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 3;

  List<Widget> screen = [
    HomeScreen(),
    ChatScreen(),
    ChatScreen(),
    CallScreen(),
    RemediesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.camera),
            label: 'Live',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            label: 'Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.handsPraying),
            label: 'Remedies',
          ),
        ],
      ),
    );
  }
}
