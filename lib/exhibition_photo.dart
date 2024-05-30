import 'package:flutter/material.dart';
import 'package:flutter_application_09/Check.dart';
import 'package:flutter_application_09/Text.dart';
import 'package:flutter_application_09/exi_list.dart';
import 'package:flutter_application_09/fav_but.dart';
import 'package:flutter_application_09/generated/l10n.dart';
import 'package:flutter_application_09/pharahos_list.dart';
import 'package:flutter_application_09/pharaoh_show.dart';
import 'package:flutter_application_09/pharaohs_list_ar.dart';

class TutPic extends StatelessWidget {
  TutPic({Key? key}) : super(key: key);
  final PharaohData pharaohData = PharaohData();
  final PharaohDataAr pharaohDataAr = PharaohDataAr();

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
                padding: EdgeInsets.only(right: IsArab() ? 20 : 30, left: IsArab() ? 0 : 0),

                child: SizedBox(
                  height: screenHeight * 0.9,
                  child: ListView.separated(
                    padding: EdgeInsets.only(top: screenHeight * 0.03),
                    scrollDirection: Axis.vertical,
                    itemCount:pharaohData.pharaoh.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: screenHeight * 0.03);
                    },
                    itemBuilder: (_, index) {
                      final ex = pharaohData.pharaoh[index];
                      return Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.04, right: screenWidth * 0.04),
                        child: Stack(
                          children: [
                            Container(
                              width: screenWidth * 0.85,
                              height: screenHeight * 0.32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PharaohDetailPage(
                                      pharaohDataAr: pharaohDataAr,
                                      pharaohData:  pharaohData,
                                      index: index,
                                    ),
                                  ),
                                );
                              },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    ex['image'] ?? '',
                                    fit: BoxFit.fill,
                                  ),
                                ),
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
