import 'package:flutter/material.dart';
import 'package:flutter_application_09/Fav_page.dart';
import 'package:flutter_application_09/Profile.dart';
import 'package:flutter_application_09/about_us.dart';
import 'package:flutter_application_09/contact_us.dart';
import 'package:flutter_application_09/notifacation.dart';
import 'package:flutter_application_09/popular_pharaoh.dart';
import 'package:flutter_application_09/pharaohs.dart';
import 'package:flutter_application_09/ticket.dart';
import 'package:flutter_application_09/exibition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tab;

  @override
  void initState() {
    super.initState();
    tab = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
       actions:  [
  Padding(
    padding: EdgeInsets.only(right: screenWidth *0.03),
    child: InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  const Not()));
      },
      child: const Icon(Icons.circle_notifications_outlined, size: 40,)),
  )
],

      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
  decoration: BoxDecoration(
    color: Color.fromRGBO(146, 112, 57, 0.78),
    image: DecorationImage(
      image: AssetImage('assets/images/app_photo.jpg'),
      fit: BoxFit.cover, // You can adjust the BoxFit as needed
    ),
  ),
  child: Text(''),
  // Your other child widgets can go here
),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Us'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const aboutus()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_phone),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TabPage()));
              },
            ),
             ListTile(
              leading: const Icon(Icons.person),
              title: const Text('profile'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ProfilePage()));
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.1, 
            child: Image.asset("assets/images/welcome.jpg"),
          ),
           Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.005),
            child: SizedBox(
              width: screenWidth * 0.95,
              child: const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    hintText: "search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100.0),
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding:  EdgeInsets.only(top: screenHeight *0.004),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    tab.animateTo(0);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Groub(),
                              ),
                              (route) => false);
                        },
                        child: Image.asset("assets/images/pharahos.jpg",
                            width: 93, height: 90, fit: BoxFit.fill)),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom: screenHeight * 0.009),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Tut()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset("assets/images/exibition.jpg",
                          width: 100, height: 90, fit: BoxFit.fill),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: screenHeight * 0.019),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Ticket()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset("assets/images/ticket.jpg",
                          width: 100, height: 90, fit: BoxFit.fill),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: screenHeight *0.02),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const favpage()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset("assets/images/faviorate.jpg",
                          width: 100, height: 100, fit: BoxFit.fill),
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
                PharaohsScreen(),
                const Tut(),
                const Ticket(),
                const favpage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    tab.dispose();
    super.dispose();
  }
}
