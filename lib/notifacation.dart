import 'package:flutter/material.dart';

class Not extends StatelessWidget {
  const Not({super.key});

  @override
  Widget build(BuildContext context) {
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
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text("NOTIFICATIONS",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text("You Have 2 Notification Today! ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
              ),
              Container(width: double.infinity,height: 650,margin: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(color:  Color.fromARGB(199, 146, 112, 57),borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))),
              child: const Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text("Pharaera Community Say Goodmorning",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w300,color: Colors.white),),
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 5,left: 300),
                  child: Text("2h ago",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w300,color: Colors.white),),
                ),
                Divider(color: Colors.white,),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text("Hello! Come And Visit Our New VRroom",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w300,color: Colors.white),),
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 5,left: 300),
                  child: Text("10h ago",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w300,color: Colors.white),),
                ),
                Divider(color: Colors.white,),
              ],),
              )
            ],
          ),
        ),),
        
        );
  }
}