import 'dart:async';
import 'package:flutter/material.dart';
import 'package:Pharera/navigation_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _currentIndex = 0;
  final List<String> _imagePaths = [
    'assets/images/wel3.jpg',
    'assets/images/wel2.jpg',
    // 'assets/images/artifacts/pyramid_view.png',
    // 'assets/images/Entrance1.png',
  ];

  late final PageController _pageController;
  bool _isFinished = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _imagePaths.length;
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  void _nextImage() {
    _stopTimer(); // Stop the timer when user interacts with the page manually
    setState(() {
      _currentIndex = (_currentIndex + 1) % _imagePaths.length;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
    _startTimer(); // Start the timer again after manual interaction
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
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(176, 255, 255, 255),
                        Color.fromARGB(136, 158, 158, 158),
                        Color.fromARGB(187, 126, 125, 125),
                        Color.fromARGB(209, 110, 109, 109),
                        Color.fromARGB(164, 67, 67, 67),
                      ]),
                    ),
                  ),
                  SwipeableButtonView(
                    buttonText: 'Lets get started',
                    buttonWidget: Icon(Icons.double_arrow_sharp, color: _isFinished ? Colors.grey : Colors.black),
                    activeColor: Colors.transparent, // Set to transparent
                    isFinished: _isFinished,
                    onWaitingProcess: () {
                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          _isFinished = true;
                        });
                      });
                    },
                    onFinish: () async {
                      _stopTimer(); // Stop the timer when user clicks on the button
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
                        _startTimer(); // Start the timer again after finishing navigation
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
