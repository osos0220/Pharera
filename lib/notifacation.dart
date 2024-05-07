import 'package:flutter/material.dart';

class Not extends StatelessWidget {
  const Not({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 226, 226, 226),leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),),
        body:  SizedBox(width: double.infinity,height: double.infinity,child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
               Padding(
                padding: EdgeInsets.only(top: screenHeight *0.05),
                child: const Text("NOTIFICATIONS",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
              ),
               Padding(
                padding: EdgeInsets.only(top: screenHeight *0.02),
                child: const Text("You Have 2 Notification Today! ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
              ),
              Container(width: double.infinity,height: screenHeight *0.9,margin:  EdgeInsets.only(top: screenHeight * 0.005),
              decoration: const BoxDecoration(color:  Color.fromARGB(199, 146, 112, 57),borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))),
              child:  Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: screenHeight *0.03),
                  child: const FittedBox(child: Text("Pharaera Community Say Goodmorning",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w300,color: Colors.white),)),
                ),
                  Padding(
                  padding: EdgeInsets.only(top: screenHeight *0.005,left: screenWidth *0.75),
                  child: const Text("2h ago",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w300,color: Colors.white),),
                ),
                const Divider(color: Colors.white,),
                 Padding(
                  padding: EdgeInsets.only(top: screenHeight *0.03),
                  child: const FittedBox(child: Text("Hello! Come And Visit Our New VRroom",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w300,color: Colors.white),)),
                ),
                 Padding(
                  padding: EdgeInsets.only(top: screenHeight *0.005,left: screenWidth *0.75),
                  child: const Text("10h ago",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w300,color: Colors.white),),
                ),
                const Divider(color: Colors.white,),
              ],),
              )
            ],
          ),
        ),),
        
        );
  }
}