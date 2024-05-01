import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  final String title;
  final TextAlign? align;
  final double? fontSize;

  const AppTextWidget({
    Key? key,
    required this.title,
    this.align,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align ?? TextAlign.start,
      style: TextStyle(
        color: Colors.black,
        fontSize: fontSize ?? 22,
      ),
    );
  }
}
