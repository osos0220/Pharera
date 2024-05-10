import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      ),
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  "assets/images/top.jpg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " Our mobile application offers A virtual tour Of one Of the most",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    " historical agespharaonic civilizations.But That's not all- we go beyond by bringing history to life ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    " through Ai-powered lip synchronization, historical characters within the musuem tell their stories.",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    " offering tourists a unique and inspiring experience. our 360- degree virtual tour",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    " creates a sense of immersion, allowing users to delve into Egypt'rich history and civilization.",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
