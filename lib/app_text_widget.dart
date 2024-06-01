import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  final String title;
  final TextAlign? align;
  final double? fontSize;

  const AppTextWidget({
    super.key,
    required this.title,
    this.align,
    this.fontSize,
  });

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
