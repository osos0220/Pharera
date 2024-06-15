// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:Pharera/Virtual_Tour/token.dart';
import 'package:Pharera/features/user_auth/presentation/pages/forget_password_page.dart';
import 'package:Pharera/features/user_auth/presentation/pages/home_page.dart';
import 'package:Pharera/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:Pharera/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:Pharera/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Pharera/cache_helper.dart';

// import 'package:flutter/widgets.dart';

import 'package:Pharera/global/common/toast.dart';
import 'package:Pharera/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:flutter/widgets.dart';
import 'package:Pharera/home.dart';
import 'package:Pharera/navigation_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();

  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(S.of(context).login, style: const TextStyle(fontFamily: 'Vollkorn')),
        leading: IconButton(icon:const Icon( Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        }),
        ),
      
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   "Email",
              //   style: TextStyle(
              //       fontSize: 27,
              //       fontWeight: FontWeight.bold,
              //       fontFamily: 'Vollkorn'),
              // ),
              // SizedBox(
              //   height: 30,
              // ),
               Text(
               S.of(context).email ,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Vollkorn'),
              ),
              const SizedBox(
                height: 7,
              ),
              FormContainerWidget(
                controller: _emailController,
                hintText: "example@gmail.com",
                isPasswordField: false,
              ),
              const SizedBox(
                height: 35,
              ),
               Text(
                S.of(context).password,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Vollkorn'),
              ),
              const SizedBox(
                height: 7,
              ),
              FormContainerWidget(
                controller: _passwordController,
                hintText: S.of(context).enterp,
                // hintStyle: TextStyle(fontFamily: 'Volkorn')
                isPasswordField: true,
              ),
              const SizedBox(
                height: 19,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const ForgetPasswordPage();
                            },
                          ),
                        );
                      },
                      child:  Text(
                       S.of(context).Forget,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 174, 158, 130),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Vollkorn'),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 19,
              ),

              GestureDetector(
                onTap: () {
                  signIn();
                  CacheHelper.saveDate(key: 'token', value: FirebaseAuth.instance.currentUser?.uid).then((value){
                    token = FirebaseAuth.instance.currentUser!.uid;
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 174, 158, 130),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color: Colors.grey.shade600)]),
                  child: Center(
                    child: _isSigning
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        :  Text(
                            S.of(context).login,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Vollkorn',
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    S.of(context).donnothaveaccount,
                    style: const TextStyle(fontFamily: 'vollkorn'),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpPage()),
                        (route) => false,
                      );
                    },
                    child: Text(
                      S.of(context).signup,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 174, 158, 130),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Vollkorn'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);
    String? token = user?.uid;

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      StrutStyle.fromTextStyle(const TextStyle(fontFamily: 'Vollkorn'));
      showToast(
        message: S.of(context).done,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    } else {
      StrutStyle.fromTextStyle(const TextStyle(fontFamily: 'Vollkorn'));
      showToast(message: S.of(context).invalid);
    }
  }
}
