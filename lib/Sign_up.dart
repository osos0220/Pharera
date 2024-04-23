import 'package:flutter/material.dart';
import 'package:flutter_application_09/sign.dart';

class Signuo extends StatefulWidget {
  const Signuo({super.key});

  @override
  State<Signuo> createState() => _SignuoState();
}

class _SignuoState extends State<Signuo> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),),
      body: SizedBox(width: double.infinity,height: double.infinity,child: 
      Column(children: [
        const Padding(
          padding: EdgeInsets.only(right: 30, top: 20),
          child: Text("SIGN UP" , style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        ),
        const SizedBox(height: 10,),
        Column(children: [
          const Padding(
            padding: EdgeInsets.only(right: 220,top: 20),
            child: Text("FIRST NAME",style:TextStyle(fontSize: 22,fontWeight: FontWeight.w800),),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child:  TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100.0),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              ),
            )
          ),
          const Padding(
            padding: EdgeInsets.only(right: 290,top: 10),
            child: Text("Email",style:TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child:  TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100.0),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              ),
            )
          ),
          const Padding(
            padding: EdgeInsets.only(right: 160,top: 20),
            child: SizedBox(width: 200,child: Text("PASSWORD",style:TextStyle(fontSize: 22,fontWeight: FontWeight.w800),)),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child:  TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100.0),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              ),
            )
          ), 
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: SizedBox(
              width: 350,
              child: Row(
                children: [
                  Text("CONFIRM PASSWORD",style:TextStyle(fontSize: 18,fontWeight: FontWeight.w800),),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child:  TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100.0),
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              ),
            )
          ), 
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: InkWell(
                onTap: (){
                   
                },
                child: Container(width: 180,height: 80,decoration: BoxDecoration(
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
           Row(
             children: [
              const Padding(
                padding: EdgeInsets.only(left: 70,top: 10),
                child: Text("Have an account?",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.black),),
              ),
               TextButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignIn()));
               }, child: const Padding(
                padding: EdgeInsets.only(),
                child: Text("LOGIN",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.black),),
                         )),
             ],
           ),
        ],)
      ]),),
    );
  }
}