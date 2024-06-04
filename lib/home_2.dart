import 'package:Pharera/Check.dart';
import 'package:Pharera/generated/l10n.dart';
import 'package:Pharera/pharaohs_list_ar.dart';
import 'package:flutter/material.dart';
import 'package:Pharera/pharaoh_show.dart';
import 'package:Pharera/pharahos_list.dart';
import 'package:Pharera/pharaohs.dart';
import 'package:Pharera/Check.dart';

class Pharaohs extends StatelessWidget {
  Pharaohs({super.key, });

  final PharaohData pharaohData = PharaohData();
  // Add this line

  @override
  Widget build(BuildContext context) {
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
                          child:  Text(
                            S.of(context).Explore,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()), // Spacer to push SEE ALL button to the right
                    Padding(
                      padding:  EdgeInsets.only(top: 40, left: IsArab() ? 10 : 80 , right: IsArab() ? 0 : 0 ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Groub(
                                     // Pass pharaohDataAr here
                                  ),
                              ),
                          );
                        },
                        child: Container(
                          width: 130,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          child:  Center(
                            child: Text(
                              S.of(context).seeall,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
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
                height: 330,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (_, index) {
                      return SizedBox(
                        height: 370,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PharaohDetailPage(
                                      pharaohData: pharaohData,
                                      index: index,
                                      // Pass pharaohDataAr here
                                  ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                IsArab() ?  pharaohData.pharaooh[index]['image']! :  pharaohData.pharaoh[index]['image']!,
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
