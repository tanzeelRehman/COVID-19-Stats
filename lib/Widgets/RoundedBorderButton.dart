import 'package:flutter/material.dart';

TextButton roundedTextButton(
    {required String label, required VoidCallback function}) {
  return TextButton(
    onPressed: function,
    child: Text(label),
    style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.green),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ))),
  );
}
