import 'package:flutter/material.dart';

class Textt extends StatelessWidget {
  final String text;

  const Textt({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 22, color: Colors.black , fontWeight: FontWeight.bold),
    );
  }
}
