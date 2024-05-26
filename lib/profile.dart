import 'package:flutter/material.dart';
import 'package:flutter_application_09/Check.dart';
import 'package:flutter_application_09/LanguagePage.dart';
import 'package:flutter_application_09/Text.dart';
import 'package:flutter_application_09/generated/l10n.dart';
import 'package:flutter_application_09/notifacation.dart';
import 'package:flutter_application_09/Fav_page.dart';
import 'package:flutter_application_09/rating.dart';



class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
          height: screenHeight * 0.13,
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
               padding: EdgeInsets.only(left: screenWidth*0.03 , right: IsArab() ? 20 : 0),
               child: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/person.jpeg'),
                           ),
             ),
            Padding(
              padding:  EdgeInsets.only(left: IsArab() ? 0 : 20 , right: IsArab() ? 20 : 0),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              Center(child: Text("Pharera" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w800),)),
              Text("Pharera@gmail.com" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w300),),
              
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
                  TextW(text: S.of(context).not,),
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>  const RatingPage()));
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
                  TextW(text: S.of(context).rate,),
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
                  TextW(text: S.of(context).fav,),
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
          padding:  EdgeInsets.only(top: screenHeight* 0.03),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const LanguageList()));
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
                  TextW(text: S.of(context).language,),
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
            padding:  EdgeInsets.only(top: 20 , right: IsArab()? 0 : screenWidth *0.5 , left: IsArab() ? 170  : 0 ),

            child: InkWell(
              onTap: (){},
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.logout , color: Colors.red,), // Icon
                  const SizedBox(width: 8), // Add spacing between icon and text
                  TextW(text: S.of(context).Logout,), // Text
                ],
              ),
            ),
          ),


        ]),
      ),
    );
  }

  
}
