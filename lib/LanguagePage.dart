import 'package:flutter/material.dart';
import 'package:flutter_application_09/Text.dart';
import 'package:get/get.dart';

class LanguageList extends StatefulWidget {
  

  const LanguageList({Key? key, }) : super(key: key);

  @override
  _LanguageListState createState() => _LanguageListState();
}

class _LanguageListState extends State<LanguageList> {
  

  @override
 

  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Column(
          mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Padding(
              padding:  EdgeInsets.only(top: screenHeight* 0.04),
              child: InkWell(
                onTap: (){
                  var locale = const Locale('en','Us');
             Get.updateLocale(locale);
                },
                child: Container(
                  width: screenWidth * 0.6,
                  height: screenWidth * 0.13,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child:  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.language, size: 30,),
                      ),
                      Center(
                        child: TextW(
                          text: "English",),
                      ),
                     
                    ],
                  ),
                ),
              ),
                     ),
                     Padding(
          padding:  EdgeInsets.only(top: screenHeight* 0.04),
          child: InkWell(
            onTap: (){
             var locale = const Locale('ar','arb');
             Get.updateLocale(locale);
            },
            child: Container(
              width: screenWidth * 0.6,
              height: screenWidth * 0.13,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child:   const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.language, size: 30,),
                  ),
                  Center(
                    child: TextW(
                     text:"العربيه",
                    ),
                  ),
                 
                ],
              ),
            ),
          ),
        ),
           ],
         ),
        
      ],)
    );
  }
}