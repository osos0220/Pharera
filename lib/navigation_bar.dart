import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:pharera/main_up.dart';
import 'package:pharera/Panorama.dart';
import 'package:pharera/register.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

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

  void CurrentI = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: ConvexAppBar(

        items: [
          TabItem(icon: Icon(Icons.home, size: screenHeight * 0.04, color: const Color.fromARGB(255, 226, 226, 226),)),
          TabItem(icon: Icon(Icons.panorama_wide_angle, size: screenHeight * 0.04 , color: const Color.fromARGB(255, 226, 226, 226),)),
          TabItem(icon: Icon(Icons.person_2, size: screenHeight * 0.04 , color: const Color.fromARGB(255, 226, 226, 226),)),
        ],
        backgroundColor: const Color.fromARGB(199, 146, 112, 57),
        activeColor: const Color.fromARGB(199, 146, 112, 57),
        initialActiveIndex: _selectedIndex,
        onTap: _onItemTapped,
        height: screenHeight * 0.07,
      ),

    );
  }
}
