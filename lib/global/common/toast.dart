import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color.fromARGB(255, 174, 158, 130),
      textColor: Colors.white,
      fontSize: 16.0);
  StrutStyle.fromTextStyle(const TextStyle(fontFamily: 'Vollkorn'));
}
