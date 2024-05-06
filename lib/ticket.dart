import 'package:flutter/material.dart';

class Ticket extends StatelessWidget {
  const Ticket({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      ),
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding:  EdgeInsets.only(top: screenHeight*0.05),
          child: Column(
            children: <Widget>[
              Image.asset("assets/images/ticket_details.jpg"),
              Padding(
                padding:  EdgeInsets.only(top: screenHeight *0.001),
                child: Container(
                  width: screenWidth*0.68,
                  height: screenHeight*0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/images/pay.jpg",
                        fit: BoxFit.fill,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
