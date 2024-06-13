import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // Import the CurvedNavigationBar
import 'package:Pharera/home.dart';
import 'package:Pharera/Panorama.dart';
import 'package:Pharera/register.dart'; // This is the register page
import 'package:Pharera/features/user_auth/presentation/pages/profile_page.dart'; // This is the profile page
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const VITPage(),
    const Register(), // This will be conditionally replaced based on user sign-in status
  ];

  void _onItemTapped(int index) async {
    if (index == 2) {
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        // User is signed in, navigate to the profile page
        setState(() {
          _pages[2] = const ProfilePage(); // Replace the Register page with the Profile page
          _selectedIndex = 2;
        });
      } else {
        // User is not signed in, navigate to the register page
        setState(() {
          _pages[2] = const Register(); // Ensure the Register page is shown
          _selectedIndex = 2;
        });
      }
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
        color: const Color(0xFFAE9E82),
        index: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          const Icon(Icons.home_filled, color: Colors.black),
          Image.asset('assets/images/360 (2).jpg', color: Colors.black),
          const Icon(Icons.person_2, color: Colors.black),
        ],
      ),
    );
  }
}
