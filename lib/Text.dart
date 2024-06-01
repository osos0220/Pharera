import 'package:flutter/material.dart';

class TextW extends StatelessWidget {
  final String text;
  
  const TextW({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 24, color: Colors.black , fontWeight: FontWeight.w500),
    );
  }
}
