import 'package:flutter/material.dart';
import 'package:pictron/src/widget/arrow_button.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Welcome to Flutter',
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Cuento'),
      ),
      body: Row(
        children: <Widget>[
          const ArrowButton(left: true),
          Ink.image(
            image: null,
            fit: BoxFit.fill),
          const ArrowButton(left: false),
        ],
      ),
    ),
  );
}