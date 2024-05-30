import 'package:flutter/material.dart';
import 'package:flutter_application_09/Text.dart';

import 'package:flutter_application_09/generated/l10n.dart';

class VITPage extends StatelessWidget {
  const VITPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Image.asset("assets/images/top.jpg"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFD5B774),
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
                      
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
                        return const Color(0xFFD5B774);
                      }),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      elevation: WidgetStateProperty.all(0),
                    ),
                    child:  SizedBox(
                      width: 280,
                      height: 80,
                      child: Center(
                        child:TextW(text: S.of(context).Ex,)
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFD5B774),
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
                      // Navigate to tour guide page
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
                        return const Color(0xFFD5B774);
                      }),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      elevation: WidgetStateProperty.all(0),
                    ),
                    child:  SizedBox(
                      width: 280,
                      height: 80,
                      child: Center(
                        child: FittedBox(child: TextW(text: S.of(context).GUID,))
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
