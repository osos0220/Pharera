import 'package:flutter/material.dart';
import 'package:flutter_application_09/Fav_page.dart';
import 'package:flutter_application_09/about_us.dart';
import 'package:flutter_application_09/contact.dart';
import 'package:flutter_application_09/notifacation.dart';
import 'package:flutter_application_09/pharaohs.dart';
import 'package:flutter_application_09/ticket.dart';
import 'package:flutter_application_09/tut.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Not()));
                },
                icon: ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.asset("assets/images/not.jpg", width: 100, height: 100)),
              ),
            ),
          ),
        ],
      ),
      drawer: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(199, 146, 112, 57),
                ),
                child: Text(
                  'WELCOME!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const aboutus()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.contact_phone),
                title: const Text('Contact Us'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TabPage()));
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset("assets/images/www.jpg"),
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100.0),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    tab.animateTo(0);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset("assets/images/phh.jpg", width: 93, height: 90, fit: BoxFit.fill),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Tut()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset("assets/images/exx.jpg", width: 100, height: 90, fit: BoxFit.fill),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: GestureDetector(
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> const Ticket()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset("assets/images/ti.jpg", width: 100, height: 90, fit: BoxFit.fill),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:13 ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const favpage()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset("assets/images/fa.jpg",width: 100, height: 100, fit: BoxFit.fill),
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
