import 'package:Pharera/Check.dart';

import 'package:flutter/material.dart';
// import 'package:Pharera/Check.dart';
// import 'package:Pharera/Text.dart';
// import 'package:Pharera/exi_list.dart';
// import 'package:Pharera/fav_but.dart';
// import 'package:Pharera/generated/l10n.dart';
import 'package:Pharera/pharahos_list.dart';
import 'package:Pharera/pharaoh_show.dart';

class TutPic extends StatelessWidget {
  TutPic({super.key});
  final PharaohData pharaohData = PharaohData();

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
                padding: const EdgeInsets.only(right: 30, left: 0),
                child: SizedBox(
                  height: screenHeight * 0.9,
                  child: ListView.separated(
                    padding: EdgeInsets.only(top: screenHeight * 0.03),
                    scrollDirection: Axis.vertical,
                    itemCount: IsArab() ?  pharaohData.pharaooh.length :  pharaohData.pharaoh.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: screenHeight * 0.03);
                    },
                    itemBuilder: (_, index) {
                      final ex = IsArab() ?  pharaohData.pharaooh[index] :  pharaohData.pharaoh[index];
                      return Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.04, right: screenWidth * 0.04),
                        child: Stack(
                          children: [
                            Container(
                              width: screenWidth * 0.95,
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
                                        pharaohData: pharaohData,
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
