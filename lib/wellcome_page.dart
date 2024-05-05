import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_09/test.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  final List<String> imagePaths = [
    'assets/images/wel2.jpg',
    'assets/images/wel3.jpg',
  ];

  late Timer _timer;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      nextImage();
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      value: 0.0, // Set initial value to 0.0
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _animationController.dispose();
    super.dispose();
  }

  void nextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % imagePaths.length;
    });
  }

  void _moveArrow() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  void skipToHomePage() {
    Future.delayed(const Duration(seconds: 4)).then((value) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage()),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: 500,
            height: double.infinity,
            child: Image.asset(
              imagePaths[currentIndex],
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            top: 740,
            child: GestureDetector(
              onTap: () {
                _timer.cancel();
                skipToHomePage();
              },
              onTapDown: (_) {
                _moveArrow();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 370,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[400], // Grey box color
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black.withOpacity(0.35), width: 0.5),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(300 * _animationController.value, 0),
                          child: child,
                        );
                      },
                      child: const Icon(
                        Icons.double_arrow,
                        size: 55,
                        color: Colors.black, // Black arrow color
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
