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
              ArrowButton(left: true, height: 60),
              Expanded(flex: 4, child:
                    Text('Hello World', textAlign: TextAlign.center)),
              ArrowButton(left: false, height: 60),
            ],
          ),
        ),
      );
}
