import 'package:flutter/material.dart';
import 'package:pictron/src/widget/arrow_button.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Welcome to Flutter'),
          ),
          body: Row(
            children: const <Widget>[
              Text('Hello World'),
              ArrowButton(left: true),
              ArrowButton(left: false),
            ],

          ),
        ),
      );
}
