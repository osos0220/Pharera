import 'package:flutter/material.dart';
import 'package:Pharera/Fav_page.dart';
import 'package:Pharera/Profile.dart';
import 'package:Pharera/about_us.dart';
import 'package:Pharera/contact.dart';
import 'package:Pharera/notifacation.dart';
import 'package:Pharera/pharaohs.dart';
import 'package:Pharera/pharaohss.dart';
import 'package:Pharera/raiting.dart';
import 'package:Pharera/navigation_bar.dart';
import 'package:Pharera/ticket.dart';
import 'package:Pharera/exhibition.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController tab;

  @override
  void initState() {
    super.initState();
    tab = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate font size based on screen width
    final double drawerHeaderFontSize = screenWidth * 0.05;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 226, 226, 226),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.01, left: screenWidth * 0.01),
              child: Container(
                width: screenWidth * 0.2,
                height: screenHeight * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.04),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Not()),
                    );
                  },
                  icon: ClipRRect(
                    borderRadius: BorderRadius.circular(screenWidth * 0.04),
                    child: Image.asset(
                      "assets/images/notification.jpg",
                      width: screenWidth * 0.16,
                      height: screenWidth * 0.16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        drawer: Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.07),
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color(0xFFAE9E82),
                  ),
                  child: Text(
                    'WELCOME!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: drawerHeaderFontSize,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home_filled),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.leftToRight,
                        child: const MyHomePage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('About Us'),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.leftToRight,
                        child: const AboutUs(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.contact_phone),
                  title: const Text('Contact Us'),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.leftToRight,
                        child: const TabPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.star),
                  title: const Text('Rate'),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.leftToRight,
                        child: RatingPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.01),
              child: Text(
                'WELCOME TO THE GEM',
                style: TextStyle(
                  fontSize: screenWidth * 0.07, // Adjust text size according to screen width
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01, width: 50,),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.03),
              child: Container(
                width: screenWidth * 0.8,  // Adjust the width as needed
                height: screenHeight * 0.05,  // Adjust the height as needed
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(screenWidth * 0.05), // Adjust border radius according to screen width
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01,
                        horizontal: screenWidth * 0.03
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.01),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.topToBottom,
                          child: const Groub(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: screenWidth * 0.12,
                          height: screenWidth * 0.12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/icons/pharaohs.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01), // Add spacing between image and text
                        Text(
                          'Pharaohs',
                          style: TextStyle(fontSize: screenWidth * 0.04), // Adjust text size
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.topToBottom,
                          child: const Tut(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: screenWidth * 0.12,
                          height: screenWidth * 0.12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/icons/exibitions.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01), // Add spacing between image and text
                        Text(
                          'Exhibitions',
                          style: TextStyle(fontSize: screenWidth * 0.04), // Adjust text size
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.topToBottom,
                          child: const Ticket(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: screenWidth * 0.12,
                          height: screenWidth * 0.12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/icons/tickets.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01), // Add spacing between image and text
                        Text(
                          'Tickets',
                          style: TextStyle(fontSize: screenWidth * 0.04), // Adjust text size
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.topToBottom,
                          child: const favpage(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: screenWidth * 0.12,
                          height: screenWidth * 0.12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/icons/Fav_Final.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01), // Add spacing between image and text
                        Text(
                          'Favorites',
                          style: TextStyle(fontSize: screenWidth * 0.04), // Adjust text size
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: tab.index,
                children: [
                  Pharaohs(),
                  const Tut(),
                  const Ticket(),
                  const favpage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tab.dispose();
    super.dispose();
  }
}