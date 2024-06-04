import 'package:flutter/material.dart';
import 'package:flutter_application_09/Fav_page.dart';
import 'package:flutter_application_09/Profile.dart';
import 'package:flutter_application_09/Text.dart';
import 'package:flutter_application_09/Texti.dart';
import 'package:flutter_application_09/about_us.dart';
import 'package:flutter_application_09/contact.dart';
import 'package:flutter_application_09/exhibition.dart';
import 'package:flutter_application_09/generated/l10n.dart';
import 'package:flutter_application_09/pharahos_list.dart';
import 'package:flutter_application_09/pharaoh_1.dart';
import 'package:flutter_application_09/navigation_bar.dart';
import 'package:flutter_application_09/notifacation.dart';
import 'package:flutter_application_09/pharaohs.dart';
import 'package:flutter_application_09/search.dart';
import 'package:flutter_application_09/ticket.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final PharaohData pharaohData = PharaohData();
  late TabController tab;
  List<Map<String, String>> displayedPharaohs = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    tab = TabController(length: 4, vsync: this);
    displayedPharaohs = PharaohData().pharaoh;
  }

  void _filterPharaohs(String query) {
    final pharaohs = PharaohData().pharaoh;
    if (query.isNotEmpty) {
      final filteredPharaohs = pharaohs.where((pharaoh) {
        final nameLower = pharaoh['name']!.toLowerCase();
        final detailsLower = pharaoh['namee']!.toLowerCase();
        final searchLower = query.toLowerCase();
        return nameLower.contains(searchLower) ||
            detailsLower.contains(searchLower);
      }).toList();
      setState(() {
        displayedPharaohs = filteredPharaohs;
      });
    } else {
      setState(() {
        displayedPharaohs = pharaohs;
      });
    }
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
              padding: EdgeInsets.only(
                  top: screenHeight * 0.001, left: screenWidth * 0.01),
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
          padding: EdgeInsets.only(top: screenHeight * 0.05),
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(199, 146, 112, 57),
                  ),
                  child: Text(""),
                ),
                ListTile(
                  leading: const Icon(Icons.home_filled),
                  title: Texti(
                    text: S.of(context).home,
                    size: 20,
                  ),
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
                  title: Texti(
                    text: S.of(context).ABOUT,
                    size: 20,
                  ),
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
                  title: Texti(
                    text: S.of(context).contact,
                    size: 20,
                  ),
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
                  leading: const Icon(Icons.settings),
                  title: Texti(size: 20, text: S.of(context).setting),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.leftToRight,
                        child: const ProfilePage(),
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
                padding: EdgeInsets.only(top: screenHeight * 0.06),
                child: TextW(
                  text: S.of(context).Welcome,
                )),
            SizedBox(
              height: screenHeight * 0.03,
              width: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchResults()),
                );
              },
              child: Container(
                width: screenWidth * 0.97, // تحديد العرض
                height: screenHeight * 0.07, // تحديد الارتفاع
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 226, 226, 226),
                  // لون الخلفية
                  borderRadius: BorderRadius.circular(40),
                  // تشكيل الحواف
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // لون الظل
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2), // التحويل في محور السي y
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 10), // تباعد بادئة
                    Icon(Icons.search), // أيقونة البحث
                    SizedBox(width: 10), // تباعد بين الأيقونة والنص
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.01),
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(screenWidth * 0.05),
                      child: Image.asset(
                        "assets/images/phh.jpg",
                        width: screenWidth * 0.232,
                        height: screenWidth * 0.225,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.01),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.topToBottom,
                            child: const Tut(),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(screenWidth * 0.05),
                        child: Image.asset(
                          "assets/images/exx.jpg",
                          width: screenWidth * 0.25,
                          height: screenWidth * 0.225,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.016),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.topToBottom,
                            child: const DiscountPage(),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(screenWidth * 0.05),
                        child: Image.asset(
                          "assets/images/ti.jpg",
                          width: screenWidth * 0.25,
                          height: screenWidth * 0.225,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.013),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.topToBottom,
                            child: const FavPage(),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(screenWidth * 0.05),
                        child: Image.asset(
                          "assets/images/fa.jpg",
                          width: screenWidth * 0.25,
                          height: screenWidth * 0.25,
                          fit: BoxFit.fill,
                        ),
                      ),
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
                  const DiscountPage(),
                  const FavPage(),
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
