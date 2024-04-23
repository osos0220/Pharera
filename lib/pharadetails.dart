import 'package:flutter/material.dart';
import 'package:flutter_application_09/pharahosl_ist.dart';

class PharaohDetailPage extends StatelessWidget {
  final PharaohData pharaohData;
  final int index;

  const PharaohDetailPage({Key? key, required this.pharaohData, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: 450,
                height: 480,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    pharaohData.getImage(index),
                    fit: BoxFit.cover,
                    height: 750,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
  width: 450,
  height: 350,
  child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      border: Border.all(
        color: Colors.black,
        width: 2, // Adjust the width of the border as needed
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        pharaohData.getName(index),
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        textAlign: TextAlign.start, // Align text to start from left
      ),
    ),
  ),
)

            ],
          ),
        ),
      ),
    );
  }
}
