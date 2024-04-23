import 'package:flutter/material.dart';
import 'package:flutter_application_09/test.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int currentIndex = 0;
  final List<String> imagePaths = [
    'assets/images/wel1.jpg',
    'assets/images/wel2.jpg',
    'assets/images/wel3.jpg',
  ];

  void nextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % imagePaths.length;
    });
  }

  void previousImage() {
    setState(() {
      currentIndex = (currentIndex - 1 + imagePaths.length) % imagePaths.length;
    });
  }

  void skipToHomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: 500,
            height: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Positioned(
            left: 333,
            top: 50,
            child: GestureDetector(
              onTap: () {
                if (currentIndex < imagePaths.length - 1) {
                  nextImage();
                } else {
                  skipToHomePage();
                }
              },
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(176, 255, 255, 255),
                    Color.fromARGB(136, 158, 158, 158),
                    Color.fromARGB(187, 126, 125, 125),
                    Color.fromARGB(209, 110, 109, 109),
                    Color.fromARGB(164, 67, 67, 67),
                  ]),
                ),
                child: IconButton(
                  onPressed: () {
                     skipToHomePage();
                  },
                  icon: const Icon(Icons.double_arrow, size: 55, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
