import 'package:flutter/material.dart';
import 'package:pharera/Virtual_Tour/free_explore.dart';

class VITPage extends StatelessWidget {
  const VITPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    //Naviagte to New page
    void _navigateToSecondPage(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SecondPage()),
      );
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.09),
                child: Image.asset("assets/images/app_photo.jpg"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.16),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp()),
                  );
                },
            //SizedBox(height: screenHeight * 0.05), // Adjust spacing as needed
            child: Container(
              width: screenWidth * 0.65,
              height: screenHeight * 0.09,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/explore_only.jpg",
                  fit: BoxFit.fill,

                ),  
              ),
            ),
          ),
        ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.16),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp()),
                  );
                },
            //SizedBox(height: screenHeight * 0.05), // Adjust spacing as needed
            child: Container(
              width: screenWidth * 0.7,
              height: screenHeight * 0.09,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/explore_with.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
        ),
        ),
        ],
        ),
      ),
    );
  }
}
class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Page")),
      body: const Center(child: Text("This is the second page.")),
    );
  }
}