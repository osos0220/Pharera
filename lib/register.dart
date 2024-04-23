import 'package:flutter/material.dart';
import 'package:flutter_application_09/Sign_up.dart';
import 'package:flutter_application_09/sign.dart';
class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
          SafeArea(child: Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Image.asset("assets/images/pl.jpg"),
          )),
            Padding(
              padding: const EdgeInsets.only(top: 160),
              child: InkWell(
                onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignIn()));
                },
                child: Container(width: 280,height: 80,decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),color: Colors.black,
                  boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), 
                      ),
                    ],
                ),
                child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset("assets/images/si.jpg",fit: BoxFit.fill,)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: InkWell(
                onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> const Signuo()));
                },
                child: Container(width: 300,height: 80,decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset("assets/images/su.jpg",fit: BoxFit.fill,)),
                  ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}