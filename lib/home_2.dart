import 'package:Pharera/Check.dart';
import 'package:Pharera/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:Pharera/pharaoh_show.dart';
import 'package:Pharera/pharahos_list.dart';
import 'package:Pharera/pharaohs.dart';
import 'package:Pharera/Check.dart';

class Pharaohs extends StatelessWidget {
  Pharaohs({super.key});

  final PharaohData pharaohData = PharaohData();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define the proportional width and height
    final containerWidth = screenWidth * 0.35; // 35% of screen width
    final containerHeight = screenHeight * 0.08; // 8% of screen height
    final textFontSize = screenWidth * 0.065; // Proportional font size for Explore text
    final buttonFontSize = screenWidth * 0.055; // Proportional font size for button
    final imageHeight = screenHeight * 0.45; // 45% of screen height

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextButton(
                          onPressed: () {
                            // Handle SEE ALL button tap
                          },
                          child: Text(
                            S.of(context).Explore,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: textFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()), // Spacer to push SEE ALL button to the right
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.05, // 5% of screen height
                          left: IsArab() ? screenWidth * 0.025 : screenWidth * 0.2, // 2.5% or 20% of screen width
                          right: IsArab() ? 0 : 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Groub(),
                            ),
                          );
                        },
                        child: Container(
                          width: containerWidth,
                          height: containerHeight,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              S.of(context).seeall,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: buttonFontSize,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(),
                height: imageHeight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (_, index) {
                      return SizedBox(
                        height: imageHeight,
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
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: screenWidth * 0.9, // 90% of screen width
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                IsArab()
                                    ? pharaohData.pharaoh_ar[index]['image']!
                                    : pharaohData.pharaoh_en[index]['image']!,
                                fit: BoxFit.cover,
                              ),
                            ),
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
