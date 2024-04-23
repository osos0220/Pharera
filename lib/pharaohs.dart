import 'package:flutter/material.dart';
import 'package:flutter_application_09/pharadetails.dart';
import 'package:flutter_application_09/pharahosl_ist.dart';
import 'package:flutter_application_09/pharaohss.dart';

class Pharaohs extends StatelessWidget {
  Pharaohs({super.key});
  final PharaohData pharaohData = PharaohData();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Row(
                children: [
                  Container(width: 170,height: 80,decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Image.asset("assets/images/xxp.jpg"),),
                  Padding(
                    padding: const EdgeInsets.only(top: 40,left: 80),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const Groub()));
                      },
                      child: Container(width: 130,height: 60,decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      child: Image.asset("assets/images/sea.jpg"),),
                    ),
                  )

                ],
              ),
            ),
            Container(
              decoration:  const BoxDecoration(),
              height: 290,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return SizedBox(
                      height: 270,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PharaohDetailPage(pharaohData: pharaohData, index: index)),
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
                            child: Image.asset(pharaohData.getImage(index), fit: BoxFit.cover),
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
    );
  }
}
