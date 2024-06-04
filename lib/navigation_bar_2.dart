import 'package:Pharera/panoram_2.dart';
import 'package:Pharera/profile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // Import the CurvedNavigationBar
import 'package:Pharera/home.dart';
import 'package:Pharera/Panorama.dart';
import 'package:Pharera/register.dart';

class MyHomePagee extends StatefulWidget {
  const MyHomePagee({super.key});

  @override
  State<MyHomePagee> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePagee> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const VITPagee(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar( // Replace AnimatedNotchBottomBar with CurvedNavigationBar
        backgroundColor: const Color(0xFFCAC4AF),
        color: const Color(0xFFAE9E82),
        index: _selectedIndex,
        onTap: _onItemTapped,
        items:  [
          const Icon(Icons.home_filled, color: Colors.black),
          Image.asset('assets/images/360 (2).jpg', color: Colors.black),
          const Icon(Icons.person_2, color: Colors.black),
        ],
      ),
    );
  }
}