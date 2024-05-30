import 'package:flutter/material.dart';
import 'fav_but.dart';
import 'pharahos_list.dart';
import 'pharaohs_list_ar.dart';

List<String> favoriteImages = [];

class PharaohDetailPage extends StatelessWidget {
  final PharaohData pharaohData;
  final PharaohDataAr pharaohDataAr;
  final int index;

  const PharaohDetailPage({
    Key? key,
    required this.pharaohData,
    required this.pharaohDataAr,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';
   String imagePath = isArabic ? pharaohDataAr.getImage(index) : pharaohData.getImage(index);


    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              child: Center(
                child: Container(
                  width: 400,
                  height: 430,
                  decoration: BoxDecoration(
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
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.fill,
                          height: 750,
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: 400,
                height: 430,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isArabic ? pharaohDataAr.getName(index) : pharaohData.getName(index),
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            isArabic ? pharaohDataAr.getDetails(index) : pharaohData.getDetails(index),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
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
