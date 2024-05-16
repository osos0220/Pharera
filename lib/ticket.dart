import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import 'webview_page.dart'; // Import the WebViewPage

class Ticket extends StatelessWidget {
  const Ticket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      ),
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/images/ttt.jpg"),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      _launchURL(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFAE9E82),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    ),
                    child: const Text(
                      'PAY NOW',
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchURL(BuildContext context) async {
    const url = 'https://visit-gem.com/en/tut';
    if (await canLaunch(url)) {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rotate,
          alignment: Alignment.bottomCenter, // Set the alignment for the rotation
          duration: const Duration(seconds: 1), // Optional: adjust the duration if needed
          child: const WebViewPage(url: url),
        ),
      );
    } else {
      print('Error launching URL: $url');
    }
  }
}
