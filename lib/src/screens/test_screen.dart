import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Welcome to Flutter',
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Flutter'),
      ),
      body: Row(
        children: <Widget>[
          const Expanded(flex: 2, child:
          Text('Hello World', textAlign: TextAlign.center)),
          // ignore: avoid_print
        ],
      ),
    ),
  );
}

