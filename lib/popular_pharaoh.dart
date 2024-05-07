import 'package:flutter/material.dart';
import 'package:pharera/Fav_but.dart';
import 'package:pharera/pharaoh_show.dart';
import 'package:pharera/pharahosl_ist.dart';
import 'package:pharera/pharaohs.dart';

class PharaohsScreen extends StatelessWidget {
   PharaohsScreen({Key? key}) : super(key: key);

  final PharaohData pharaohData = PharaohData();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SizedBox(
        width: screenWidth,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: screenWidth * 0.015,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.05,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenWidth * 0.4,
                      height: screenWidth * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.asset("assets/images/explore_word.jpg"),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Groub()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.05, top: screenWidth * 0.07),
                        child: Container(
                          width: screenWidth * 0.3,
                          height: screenWidth * 0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Image.asset("assets/images/see_all.jpg"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: screenWidth * 0.8,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenWidth * 0.05,
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (_, index) {
                      return SizedBox(
                        width: screenWidth * 0.85,
                        height: screenWidth * 0.007,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PharaohDetailPage(
                                  pharaohData: pharaohData,
                                  index: index,
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children:[ Container(
                              height: screenWidth*0.8,
                              width: screenWidth*0.9,
                              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  pharaohData.getImage(index),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const HeartIconButton(),
                            ]
                          ),
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
