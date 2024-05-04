import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_09/First.dart';
import 'package:flutter_application_09/Panorama.dart';
import 'package:flutter_application_09/register.dart';
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
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icon(Icons.home), title: "HOME"),
          TabItem(icon: Icon(Icons.panorama_wide_angle), title: "360"),
          TabItem(icon: Icon(Icons.person_2), title: "Prpfile"),
        ],
        backgroundColor: const Color.fromARGB(199, 146, 112, 57),
        activeColor: const Color.fromARGB(255, 226, 226, 226),
        initialActiveIndex: _selectedIndex,
        onTap: _onItemTapped,
        height: 70,
      ),
    );
  }
}
