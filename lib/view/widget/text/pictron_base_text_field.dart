import 'package:flutter/material.dart';

class PictronBaseTextField extends TextField {

  PictronBaseTextField({
    Key key,
    String placeholder,
    bool obscureText = false,
  }) : super(
    controller: TextEditingController(),
    decoration:
      null == placeholder
        ? null
        : InputDecoration(
          hintText: placeholder,
        ),
    key: key,
    obscureText: obscureText,
  );
}

