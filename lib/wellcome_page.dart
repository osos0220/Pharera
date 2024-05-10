import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_09/test.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int _currentIndex = 0;
  final List<String> _imagePaths = [
    'assets/images/wel2.jpg',
    'assets/images/wel3.jpg',
  ];

  late final PageController _pageController;
  bool _isFinished = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _imagePaths.length;
    });
  }

  void onFinish() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage()),
    ).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: 500,
            height: double.infinity,
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: _imagePaths.map((path) => Image.asset(path, fit: BoxFit.cover)).toList(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SwipeableButtonView(
                buttonText: 'Lets get started',
                buttonWidget: Icon(Icons.arrow_forward_ios_rounded, color: _isFinished ? Colors.grey : Colors.black),
                activeColor: const Color(0xFFB0ACAC),
                isFinished: _isFinished,
                onWaitingProcess: () {
                  Future.delayed(const Duration(seconds: 2), () {
                    setState(() {
                      _isFinished = true;
                    });
                  });
                },
                onFinish: () async {
                  await Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: const MyHomePage(),
                    ),
                  );

                  // Reset the state
                  setState(() {
                    _isFinished = false;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
