

import 'package:Pharera/generated/l10n.dart';
import 'package:Pharera/language.dart';
import 'package:flutter/material.dart';
import 'package:Pharera/fav_page.dart';
import 'package:Pharera/notifacation.dart';
import 'package:Pharera/rating.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 226, 226, 226),),
      body:  SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.2 , left: screenWidth* 0.009),
            child:  Container(
          width: screenWidth * 0.9,
          height: screenHeight * 0.11,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3), 
              ),
            ],
          ),
          child:  Row(children: [
             Padding(
               padding: EdgeInsets.only(left: screenWidth*0.03),
               child: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/person.jpeg'),
                           ),
             ),
            Padding(
              padding:  EdgeInsets.only(left: screenWidth*0.03),
              child: Column(children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.025, right: screenWidth* 0.26),
                child: const Text("Pharera" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w800),),
              ),
              const Text("Pharera@gmail.com" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w300),),
              
                         ],),
            )

          ]),
        ),
          ),
        Padding(
          padding:  EdgeInsets.only(top: screenHeight* 0.04),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const Not()));
            },
            child: Container(
              width: screenWidth * 0.9,
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
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.circle_notifications_outlined , size: 30,),
                  ),
                  Text(
                    S.of(context).not,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_forward),
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const RatingPage()));
            },
            child: Container(
              width: screenWidth * 0.9,
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
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.star, size: 30,),
                  ),
                  Text(
                    S.of(context).rate,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_forward),
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>  LanguageSelectionPage()));
            },
            child: Container(
              width: screenWidth * 0.9,
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
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.language, size: 30,),
                  ),
                  Text(
                    S.of(context).language,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_forward),
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const favpage()));
            },
            child: Container(
              width: screenWidth * 0.9,
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
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.favorite, size: 30,),
                  ),
                  Text(
                    S.of(context).fav,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ),
          ),
        ),
          
          Padding(
            padding:  EdgeInsets.only(top: screenHeight*0.04 , right: screenWidth *0.65 ),
            child: InkWell(
              onTap: (){},
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.logout , color: Colors.red,), // Icon
                  const SizedBox(width: 8), // Add spacing between icon and text
                  Text(S.of(context).Logout), // Text
                ],
              ),
            ),
          ),


        ]),
      ),
    );
  }

  
}
