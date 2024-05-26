import 'package:flutter/material.dart';
import 'package:flutter_application_09/Check.dart';
import 'package:flutter_application_09/Text.dart';
import 'package:flutter_application_09/Texti.dart';
import 'package:flutter_application_09/generated/l10n.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
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
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 25, top: 40, left: IsArab() ? 25 : 0),
                  child: TextW(
                    text: S.of(context).login,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: IsArab() ? 10 : 300, top: 40, left: IsArab() ? 220 : 0),
                    child: FittedBox(child: TextW(text: S.of(context).email)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100.0),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: IsArab() ? 10 : 260, top: 40, left: IsArab() ? 270 : 10),
                    child: FittedBox(child: TextW(text: S.of(context).password)), // Ensure FittedBox is used here as well
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextField(
                      obscureText: _obscurePassword,
                      maxLength: 32,
                      decoration: InputDecoration(
                        hintText: S.of(context).enterp,
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100.0),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: IsArab() ? 10 : 200, left: IsArab() ? 220 : 0),
                      child: FittedBox(child: Texti(text: S.of(context).Forget, size: 20,)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your login functionality here
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                          (Set<WidgetState> states) {
                            return const Color(0xFFAE9E82);
                          },
                        ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        elevation: WidgetStateProperty.all<double>(7),
                        shadowColor: WidgetStateProperty.all<Color>(Colors.black.withOpacity(0.5)),
                      ),
                      child: Container(
                        width: 180,
                        height: 80,
                        alignment: Alignment.center,
                        child: TextW(
                          text: S.of(context).login,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
