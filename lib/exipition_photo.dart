import 'package:flutter/material.dart';
import 'package:flutter_application_09/Fav_but.dart';

class TutPic extends StatelessWidget {
  const TutPic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only( top: screenHeight * 0.03, bottom: screenHeight * 0.03),
                  child: const Center(
                    child: Text(
                      "Exhibition Pictures",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.7, // Adjust height as needed
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: 3, // Set a higher itemCount
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: screenHeight * 0.03);
                    },
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.04),
                        child: Stack(
                          children: [
                            Container(
                              width: screenWidth * 0.85,
                              height: screenHeight * 0.32, // Adjust height as needed
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.black,
                              ),
                              
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left:screenWidth*0.7 ),
                              child: const HeartIconButton(),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
