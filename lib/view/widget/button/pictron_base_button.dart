import 'package:flutter/material.dart';

class PictronBaseButton extends ButtonBar {
  PictronBaseButton({
    Key key,
    String text = '',
    Function function,
    TextStyle textStyle,
  }) : super(
    key: key,
    children: <Widget>[
      RaisedButton(
          onPressed: () {
            function();
          },
          child: Text(text, style: textStyle))
    ],
  );
}
