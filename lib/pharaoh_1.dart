import 'package:flutter/material.dart';
import 'package:flutter_application_09/Text.dart';
import 'package:flutter_application_09/Texti.dart';
import 'package:flutter_application_09/fav_but.dart';
import 'package:flutter_application_09/generated/l10n.dart';
import 'package:flutter_application_09/pharahos_list.dart';
import 'package:flutter_application_09/pharaoh_show.dart';
import 'package:flutter_application_09/pharaohs.dart';
import 'package:flutter_application_09/pharaohs_list_ar.dart';
 // Assuming this is the correct file name for PharaohDetailPage

class Pharaohs extends StatelessWidget {
  Pharaohs({super.key, });

  final PharaohData pharaohData = PharaohData();
  final PharaohDataAr pharaohDataAr = PharaohDataAr();

 

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Texti(text: S.of(context).Explore, size: 28,),
                        
                      ),
                    ),
                    Expanded(child: Container()), // Spacer to push SEE ALL button to the right
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
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
                          width: 130,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Texti(text: S.of(context).seeall, size: 20,),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Stack(
                children:[ Container(
                  decoration: const BoxDecoration(),
                  height: 290,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (_, index) {
                        return Stack(
                          children:[ SizedBox(
                            height: 270,
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
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                width: 350,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    pharaohData.getImage(index),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        
                          ]
                        );
                      },
                    ),
                  ),
                ),
                
                
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}
