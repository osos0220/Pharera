import 'package:flutter/material.dart';
import 'package:flutter_application_09/Check.dart';
import 'package:flutter_application_09/Text.dart';
import 'package:flutter_application_09/Texti.dart';
import 'package:flutter_application_09/generated/l10n.dart';
import 'package:flutter_application_09/sign_in.dart';


class Signuo extends StatefulWidget {
  const Signuo({super.key});

  @override
  State<Signuo> createState() => _SignuoState();
}

class _SignuoState extends State<Signuo> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  final int _maxPasswordLength = 32;
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
              Padding(
                padding: EdgeInsets.only(right: IsArab() ? 0 : 0, top: 10 , ),
                child: TextW(text: S.of(context).create,),
              ),
              const SizedBox(height: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   Padding(
                    padding: EdgeInsets.only(right: IsArab() ? 0 : 230,  left: IsArab() ? 250 : 0),

                    child: FittedBox(child: TextW(text: S.of(context).name,)),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child:  TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100.0),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                        ),
                      )
                  ),
                   Padding(
                    padding:  EdgeInsets.only(right: IsArab() ? 0 : 300,top: 20 ,left: IsArab() ? 220 : 0),
                    child: TextW(text: S.of(context).email,),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child:  TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100.0),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                        ),
                      )
                  ),
                   Padding(
                    padding:  EdgeInsets.only(right: IsArab() ? 0 : 200,top: 20 , left: IsArab() ? 180 : 10),
                    child: SizedBox(width: 200,child: TextW(text: S.of(context).password,),)
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextField(
                      obscureText: _obscurePassword,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
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
                        counterText: "${_passwordController.text.length}/$_maxPasswordLength", // Show character count
                        hintText:  S.of(context).enterp,
                      ),
                      maxLength: _maxPasswordLength,
                    ),
                  ),
                   Padding(
                    padding:  EdgeInsets.only(right: IsArab() ? 0 : 100,left: IsArab() ? 40 : 10),
                    child: SizedBox(
                      width: 350,
                      child: Row(
                        children: [
                          TextW(text: S.of(context).Conform,),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextField(
                      obscureText: _obscureConfirmPassword,
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword = !_obscureConfirmPassword;
                            });
                          },
                        ),
                        counterText: "${_confirmPasswordController.text.length}/$_maxPasswordLength", // Show character count
                        hintText: S.of(context).Conform,
                      ),
                      maxLength: _maxPasswordLength,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only( right : IsArab() ? 10 : 0 , left: IsArab()?0:10),
                    child: Row(
                      children: [
                         FittedBox(child: Texti(text: S.of(context).haveaccount, size: 20,)),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SignIn()));
                          },
                          child:  Padding(
                            padding: const EdgeInsets.only(),
                            child: Texti(text: S.of(context).login, size: 20,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextButton(
                      onPressed: (){
                        // Add your sign-up functionality here
                      },
                      child: Container(
                        width: 180,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFAE9E82),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child:  Center(
                          child: TextW(text: S.of(context).signup,),
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
