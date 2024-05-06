import 'package:flutter/material.dart';
import 'package:flutter_application_09/navigation_bar.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int currentIndex = 0;
  double _leftPosition = 0.0;
  final PageController _pageController = PageController();
  final List<String> imagePaths = [
    'assets/images/welcome_photo_1.jpg',
    'assets/images/welcome_photo_2.jpg',
    'assets/images/welcome_photo_3.jpg',
  ];

  void skipToHomePage() {
    Future.delayed(const Duration(seconds: 4)).then((value) => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        ));
  }

  void _scrollToNextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % imagePaths.length;
    });
    _pageController.animateToPage(
      currentIndex,
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
    );
    if (currentIndex < imagePaths.length - 1) {
      Future.delayed(const Duration(seconds: 2), _scrollToNextImage);
    } else {
      // Reach the last image, go to the home page
      skipToHomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Calculate total duration to display all images
    final totalDuration = Duration(seconds: imagePaths.length * 2);

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return Image.asset(
                imagePaths[index],
                fit: BoxFit.cover,
              );
            },
          ),
          Positioned(
            left: 0,
            top: 740,
            child: GestureDetector(
              onTap: () {
                if (currentIndex < imagePaths.length - 1) {
                  _scrollToNextImage();
                } else {
                  skipToHomePage();
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: 380,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(176, 255, 255, 255),
                      Color.fromARGB(136, 158, 158, 158),
                      Color.fromARGB(187, 126, 125, 125),
                      Color.fromARGB(209, 110, 109, 109),
                      Color.fromARGB(164, 67, 67, 67),
                    ]),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AnimatedContainer(
                      curve: Curves.easeInToLinear,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      transform: Matrix4.translationValues(_leftPosition, 0.0, 0.0),
                      duration: totalDuration,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _leftPosition = _leftPosition == 0.0 ? 310.0 : 0.0;
                          });
                          // Start scrolling through the images
                          _scrollToNextImage();
                        },
                        child: const Icon(Icons.double_arrow, size: 55, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
