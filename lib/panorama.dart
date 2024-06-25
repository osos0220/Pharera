import 'package:Pharera/features/user_auth/presentation/pages/login_page.dart';
import 'package:Pharera/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:Pharera/Virtual_Tour/free_explore.dart';
import 'package:Pharera/Virtual_Tour/tour_guide.dart';
import 'Virtual_Tour/vr_screen.dart';
import 'is_signed.dart';

class VITPage extends StatelessWidget {
  const VITPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final imageWidth = screenWidth * 0.8; // 80% of screen width
    final containerWidth = screenWidth * 0.75; // 75% of screen width
    final containerHeight = screenHeight * 0.1; // 10% of screen height
    final paddingTop1 = screenHeight * 0.12; // 12% of screen height
    final paddingTop2 = screenHeight * 0.1; // 10% of screen height
    final paddingTop3 = screenHeight * 0.04; // 4% of screen height
    final textFontSize = screenWidth * 0.055; // Proportional font size


    // Method to show a dialog if the user is not signed in
    void showSignInDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(S.of(context).signInRequiredTitle),
            content: Text(S.of(context).signInRequiredMessage),
            actions: [
              TextButton(
                child: Text(S.of(context).signInButton),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
              ),
              TextButton(
                child: Text(S.of(context).cancelButton),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: paddingTop1),
                  child: Image.asset(
                    "assets/images/top.jpg",
                    width: imageWidth,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: paddingTop2),
                child: Container(
                  width: containerWidth,
                  height: containerHeight,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFCCAE6B),
                        Color(0xFFD5B975),
                        Color(0xFFD4B97C),
                        Color(0xFFE0C586),
                        Color(0xFFEED392),
                        Color(0xFFE8CD8C),
                        Color(0xFFDABF80),
                        Color(0xFFCBB073),
                        Color(0xFFBBA267),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FreeExplore(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        S.of(context).Ex,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: textFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: paddingTop3),
                child: Container(
                  width: containerWidth,
                  height: containerHeight,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFCCAE6B),
                        Color(0xFFD5B975),
                        Color(0xFFD4B97C),
                        Color(0xFFE0C586),
                        Color(0xFFEED392),
                        Color(0xFFE8CD8C),
                        Color(0xFFDABF80),
                        Color(0xFFCBB073),
                        Color(0xFFBBA267),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (isUserSignedIn()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TourGuide(),
                          ),
                        );
                      } else {
                        showSignInDialog(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        S.of(context).GUID,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: textFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: paddingTop3),
                child: Container(
                  width: containerWidth,
                  height: containerHeight,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFCCAE6B),
                        Color(0xFFD5B975),
                        Color(0xFFD4B97C),
                        Color(0xFFE0C586),
                        Color(0xFFEED392),
                        Color(0xFFE8CD8C),
                        Color(0xFFDABF80),
                        Color(0xFFCBB073),
                        Color(0xFFBBA267),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Vr_screen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        S.of(context).VR,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: textFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
