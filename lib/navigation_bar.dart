import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // Import the CurvedNavigationBar
import 'package:flutter_application_09/first.dart';
import 'package:flutter_application_09/Panorama.dart';
import 'package:flutter_application_09/register.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const VITPage(),
    const Register(),
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
        height: 60,
        items:  [
          const Icon(Icons.home_filled, color: Colors.black),
          Image.asset('assets/images/360 (2).jpg', color: Colors.black),
          const Icon(Icons.person_2, color: Colors.black),
          
        ],
      ),
    );
  }
}