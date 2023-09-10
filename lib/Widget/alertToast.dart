import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

alertToast(String message, var backgroundColor, var textColor) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0);
}
