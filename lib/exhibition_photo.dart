import 'package:flutter/material.dart';
import 'package:flutter_application_09/Check.dart';
import 'package:flutter_application_09/Text.dart';
import 'package:flutter_application_09/fav_but.dart';
import 'package:flutter_application_09/generated/l10n.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.only(right: IsArab()? 20 : 30, left: IsArab()? 0 : 0, ),

                child: SizedBox(
                  height: screenHeight * 0.9, // Adjust height as needed
                  child: ListView.separated(
                    padding: EdgeInsets.only(top: screenHeight * 0.03),
                    scrollDirection: Axis.vertical,
                    itemCount: 3, // Set a higher itemCount
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: screenHeight * 0.03);
                    },
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.04, right: screenWidth * 0.04),
                        child: Stack(
                          children: [
                            Container(
                              width: screenWidth * 0.85,
                              height: screenHeight * 0.32, // Adjust height as needed
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                              ),
                            ),
                           
                          ],
                        ),
                      );
                    },
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
