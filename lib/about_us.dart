import 'package:flutter/material.dart';

class aboutus extends StatelessWidget {
  const aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 226, 226, 226),),
     backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
          SafeArea(child: Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Image.asset("assets/images/top.jpg"),
          )),
          
            const Padding(
              padding: EdgeInsets.only(top: 450,left: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  
                  children: [
                    Text(" Our mobile application offers A virtual tour Of one Of the most",style: TextStyle(fontSize: 20),),
                    Text(" historical agespharaonic civilizations.But That's not all- we go beyond by bringing history to life ",style: TextStyle(fontSize: 20),),
                    Text(" through Ai-powered lip synchronization, historical characters within the musuem tell their stories.",style: TextStyle(fontSize: 20),),
                    Text(" offering tourists a unique and inspiring experience. our 360- degree virtual tour",style: TextStyle(fontSize: 20),),
                    Text(" creates a sense of immersion, allowing users to delve into Egypt'rich history and civilization.",style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}