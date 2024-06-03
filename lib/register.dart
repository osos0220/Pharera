import 'package:Pharera/generated/l10n.dart';
import 'package:flutter/material.dart';
// import 'package:Pharera/sign_up.dart';
// import 'package:Pharera/sign_in.dart';
import 'package:Pharera/features/user_auth/presentation/pages/login_page.dart';
import 'package:Pharera/features/user_auth/presentation/pages/sign_up_page.dart';
class Register extends StatelessWidget {
  const Register({super.key, Key});

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
                  child: Image.asset("assets/images/pl.jpg"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 110),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  child: Container(
                    width: 280,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child:  Center(
                      child: Text(
                        S.of(context).signin,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpPage()),
                    );
                  },
                  child: Container(
                    width: 280,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child:  Center(
                      child: Text(
                       S.of(context).signup,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
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
