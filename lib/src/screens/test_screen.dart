import 'package:flutter/material.dart';
import 'package:pictron/src/widget/arrow_button.dart';
import 'package:pictron/src/widget/secret_button.dart';

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
              const ArrowButton(left: true, height: 60),
              const Expanded(flex: 2, child:
                    Text('Hello World', textAlign: TextAlign.center)),
              // ignore: avoid_print
              SecretButton(event: (){print('secret button');})
            ],
          ),
        ),
      );
}
