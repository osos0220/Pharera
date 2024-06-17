import 'package:Pharera/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Pharera/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:flutter/widgets.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future PasswordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(S.of(context).password_reset),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:const Icon( Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        }),
        backgroundColor: const Color.fromARGB(255, 174, 158, 130),
        elevation: 5.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              S.of(context).EnterEmail,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: FormContainerWidget(
              controller: _emailController,
              hintText: "example@gmail.com",
              isPasswordField: false,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: PasswordReset,
            color: const Color.fromARGB(255, 174, 158, 130),
            child: Text(S.of(context).Reset),
          )
        ],
      ),
    );
  }
}
