import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import 'webview_page.dart'; // Import the WebViewPage

class Ticket extends StatelessWidget {
  const Ticket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      ),
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'For getting ticket click pay now',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),// Set the desired height for the image
                      child: Image.asset("assets/images/Ticket.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 35.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 20), // Adjust the height here
                          _buildPriceRow('Adult', '350 L.E'),
                          const SizedBox(height: 10), // Add padding between containers
                          _buildPriceRow('Youth', '200 L.E'),
                          const SizedBox(height: 10), // Add padding between containers
                          _buildPriceRow('Student', '200 L.E'),
                          const SizedBox(height: 10), // Add padding between containers
                          _buildPriceRow('Senior', '200 L.E'),
                          const SizedBox(height: 10),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _launchURL(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFAE9E82),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
              ),
              child: const Text(
                'PAY NOW',
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(String title, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontSize: 20,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
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