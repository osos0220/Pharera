// ignore_for_file: prefer_const_literals_to_create_immutables

//import 'package:auth/features/user_auth/presentation/pages/home_page.dart';
import 'package:Pharera/features/user_auth/presentation/pages/login_page.dart';
import 'package:Pharera/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:Pharera/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Pharera/global/common/toast.dart';
import 'package:flutter/widgets.dart';
import '../../firebase_auth_implementation/firebase_auth_services.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isSigningUp = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:const Icon( Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        }),
        automaticallyImplyLeading: false,
        title:  Text(
          S.of(context).signup,
          style: const TextStyle(fontFamily: 'Vollkorn'),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).name,
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
                  controller: _usernameController,
                  hintText: "eg.Mohamed_Ahmed",
                  hintStyle: 'Vollkorn',
                  isPasswordField: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                 Text(
                  S.of(context).email,
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
                  height: 20,
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
                  isPasswordField: true,
                ),
                const SizedBox(
                  height: 23,
                ),
                GestureDetector(
                  onTap: () {
                    _signUp();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 174, 158, 130),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(color: Colors.grey.shade600)]),
                    child: Center(
                        child: isSigningUp
                            ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                            :  Text(
                          S.of(context).signup,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Vollkorn'),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      S.of(context).haveaccount,
                      style: const TextStyle(fontFamily: 'Vollkorn'),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                                  (route) => false);
                        },
                        child:  Text(
                          S.of(context).login,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 174, 158, 130),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Vollkorn'),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      isSigningUp = false;
    });
    if (user != null) {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore.collection("users").doc(user.uid).set({
        "username": username,
        "email": email,
        "createdAt": FieldValue.serverTimestamp(),
        "uid": user.uid
      });
      StrutStyle.fromTextStyle(const TextStyle(fontFamily: 'Vollkorn'));
      showToast(message:S.of(context).donelogin);
      // Navigator.pushNamed(context as BuildContext, "/home");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } else {
      StrutStyle.fromTextStyle(const TextStyle(fontFamily: 'Vollkorn'));
      showToast(message: S.of(context).donenot);
    }
  }
}