import 'package:Pharera/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'webview_page.dart'; // Import the WebViewPage
import 'dart:io';

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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        S.of(context).pay,
                        style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0), // Set the desired height for the image
                      child: Image.asset("assets/images/Ticket.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 35.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 20), // Adjust the height here
                          _buildPriceRow(S.of(context).adult, S.of(context).L_e_aud),
                          const SizedBox(height: 10), // Add padding between containers
                          _buildPriceRow(S.of(context).youth, S.of(context).L_e_y),
                          const SizedBox(height: 10), // Add padding between containers
                          _buildPriceRow(S.of(context).student, S.of(context).L_e_s),
                          const SizedBox(height: 10), // Add padding between containers
                          _buildPriceRow(S.of(context).senior, S.of(context).L_e_se),
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
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const WebViewPage(url: 'https://visit-gem.com/en/tut'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFAE9E82),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
              ),
              child: Text(
                S.of(context).pay,
                style: const TextStyle(fontSize: 25, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(String title, String le) {
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
            le,
            style: const TextStyle(
              fontSize: 20,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}