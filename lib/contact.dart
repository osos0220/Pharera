import 'package:flutter/material.dart';

class TabPage extends StatelessWidget {
  const TabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: DefaultTabController(
        
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Email'),
                Tab(text: 'FaceBook'),
                Tab(text: 'Instagram'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              TabContent(imagePath: 'assets/images/Email-Image.png', text: 'support@pharera.com'),
              TabContent(imagePath: 'assets/images/face.jpeg', text: 'Pharera'),
              TabContent(imagePath: 'assets/images/instagram.jpeg', text: 'pharera'),
            ],
          ),
        ),
      ),
    );
  }
}

class TabContent extends StatelessWidget {
  final String imagePath;
  final String text;

  const TabContent({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
