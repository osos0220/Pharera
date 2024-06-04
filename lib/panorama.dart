import 'package:Pharera/generated/l10n.dart';
import 'package:flutter/material.dart';



class VITPage extends StatelessWidget {
  const VITPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Image.asset(
                    "assets/images/top.jpg",
                    width: screenWidth *
                        0.8, // Adjust image width based on screen width
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Container(
                  width: 290, // Adjust container width as needed
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFCCAE6B),
                        Color(0xFFD5B975),
                        Color(0xFFD4B97C),
                        Color(0xFFE0C586),
                        Color(0xFFEED392),
                        Color(0xFFE8CD8C),
                        Color(0xFFDABF80),
                        Color(0xFFCBB073),
                        Color(0xFFBBA267),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                     
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        S.of(context).Ex,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                    width: 290, // Adjust container width as needed
                    height: 80,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFCCAE6B),
                        Color(0xFFD5B975),
                        Color(0xFFD4B97C),
                        Color(0xFFE0C586),
                        Color(0xFFEED392),
                        Color(0xFFE8CD8C),
                        Color(0xFFDABF80),
                        Color(0xFFCBB073),
                        Color(0xFFBBA267),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      
                      // Navigate to tour guide page
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child:  Center(
                      child: Text(
                        S.of(context).GUID,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ),
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}