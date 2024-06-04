import 'package:Pharera/generated/l10n.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

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
            const SizedBox(height: 30,),
             Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                     S.of(context).Our,
                    style: const TextStyle(fontSize: 20),
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
