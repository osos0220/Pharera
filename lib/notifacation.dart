import 'package:flutter/material.dart';
import 'package:flutter_application_09/Text.dart';
import 'package:flutter_application_09/generated/l10n.dart';

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
                child:  TextW(text: S.of(context).not,),
              ),
               Padding(
                padding: EdgeInsets.only(top: screenHeight *0.02),
                child:  TextW(text: S.of(context).have,),
              ),
              Container(width: double.infinity,height: screenHeight *0.9,margin:  EdgeInsets.only(top: screenHeight * 0.005),
              decoration: const BoxDecoration(color:  Color.fromARGB(199, 146, 112, 57),borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))),
              child:  Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: screenHeight *0.03),
                  child:  FittedBox(child: TextW(text: S.of(context).not1,)),
                ),
                 
                const Divider(color: Colors.white,),
                 Padding(
                  padding: EdgeInsets.only(top: screenHeight *0.03),
                  child:  FittedBox(child: TextW(text: S.of(context).not2,)),
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