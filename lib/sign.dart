import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 226, 226, 226)
        ,leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),),
      body: SizedBox(width: double.infinity,height: double.infinity,child: 
      Column(children: [
        const Padding(
          padding: EdgeInsets.only(right: 30, top: 130),
          child: Text("SIGN IN" , style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        ),
        const SizedBox(height: 10,),
        Column(children: [
          const Padding(
            padding: EdgeInsets.only(right: 290,top: 70),
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
            padding: EdgeInsets.only(right: 180,top: 20),
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
          TextButton(onPressed: (){}, child: const Padding(
            padding: EdgeInsets.only(left: 150),
            child: Text("Forget password!",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.black),),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child:  InkWell(
                onTap: (){
                   
                },
                child: Container(width: 180,height: 80,decoration: BoxDecoration(
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
        ],)
      ]),),
    );
  }
}
