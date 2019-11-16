import 'package:flutter/material.dart';

class PictronBaseButton extends ButtonBar {
  PictronBaseButton({
    Key key,
    String text = '',
    @required VoidCallback onPressed,
    TextStyle textStyle,
  }) : super(
    key: key,
    children: <Widget>[
      RaisedButton(
          onPressed: onPressed,
          child: Text(text, style: textStyle))
    ],
  );
}
