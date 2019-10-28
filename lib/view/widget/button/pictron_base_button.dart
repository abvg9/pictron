import 'package:flutter/material.dart';

class PictronBaseButton extends ButtonBar {
  PictronBaseButton({
    Key key,
    String text = "",
    Function function,
    TextStyle textStyle,
  }) : super(
          children: <Widget>[
            RaisedButton(
                onPressed: () {
                  function();
                },
                child: Text(text, style: textStyle))
          ],
        );
}
