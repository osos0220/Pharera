import 'package:flutter/material.dart';

class Texti extends StatelessWidget {
  final String text;
  final double size ;
  const Texti({Key? key, required this.text, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  TextStyle(fontSize: size, color: Colors.black , fontWeight: FontWeight.w500),
    );
  }
}