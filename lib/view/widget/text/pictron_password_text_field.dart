import 'package:flutter/material.dart';
import 'package:pictron/view/widget/text/pictron_base_text_field.dart';

class PictronPasswordTextField extends PictronBaseTextField {
  PictronPasswordTextField({
    Key key,
    String placeholder,
  }) : super(
    key: key,
    placeholder: placeholder,
    obscureText: true,
  );
}