import 'package:flutter/material.dart';

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
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 25, top: 40),
                child: Text(
                  "SIGN IN",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 290, top: 40),
                    child: Text(
                      "Email",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                    ),
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
                        contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0), // Adjusted content padding
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 270, top: 20),
                    child: Text(
                      "Password",
                      style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextField(
                      obscureText: _obscurePassword,
                      maxLength: 32, // Maximum character limit
                      decoration: InputDecoration(
                        hintText: "  Enter Password",
                        hintStyle: const TextStyle(
                          color: Colors.grey, // Add color to highlight the hint text
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100.0),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0), // Adjusted content padding
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
                    child: const Padding(
                      padding: EdgeInsets.only(left: 150),
                      child: Text(
                        "Forget password!",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your login functionality here
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                            return const Color(0xFFAE9E82);
                          },
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        elevation: MaterialStateProperty.all<double>(7),
                        shadowColor: MaterialStateProperty.all<Color>(Colors.black.withOpacity(0.5)),
                      ),
                      child: Container(
                        width: 180,
                        height: 80,
                        alignment: Alignment.center,
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
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
