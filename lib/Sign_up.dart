import 'package:flutter/material.dart';
import 'package:flutter_application_09/sign_in.dart';

class Signuo extends StatelessWidget {
  const Signuo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              SizedBox(height: screenHeight * 0.1),
              Column(
                
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.1,
                      top: screenHeight * 0.01,
                    ),
                    child: const Row(
                      children: [
                        Text(
                          "FIRST NAME",
                          style: TextStyle(
                            fontSize: 18,
                              fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.009,left: screenWidth * 0.07),
                    child: SizedBox(
                      width: screenWidth * 0.8,
                      child: TextField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.015,
                            horizontal: screenWidth * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.1,
                      top: screenHeight * 0.01,
                    ),
                    child: const Row(
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 18,
                              fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.009,left: screenWidth * 0.07),
                    child: SizedBox(
                      width: screenWidth * 0.8,
                      child: TextField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.015,
                            horizontal: screenWidth * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.1,
                      top: screenHeight * 0.01,
                    ),
                    child: const Row(
                      children: [
                        Text(
                          "PASSWORD",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                 
                  Padding(
                    padding:EdgeInsets.only(top: screenHeight * 0.009,left: screenWidth * 0.07),
                    child: SizedBox(
                      width: screenWidth * 0.8,
                      child: TextField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.015,
                            horizontal: screenWidth * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.1,
                      top: screenHeight * 0.02,
                    ),
                    child: const Expanded(
                      child: Row(
                        children: [
                          Text(
                            "CONFIRM PASSWORD",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.009,left: screenWidth * 0.07),
                    child: SizedBox(
                      width: screenWidth * 0.8,
                      child: TextField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.015,
                            horizontal: screenWidth * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.04 , left: screenHeight * 0.09),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: screenWidth * 0.6,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/sign_up.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth * 0.1,
                          top: screenHeight * 0.05,
                        ),
                        child: const Text(
                          "Have an account?",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: screenHeight*0.05),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SignIn()),
                            );
                          },
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
