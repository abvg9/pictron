import 'package:flutter/material.dart';
import 'view/login.dart';

void main() => runApp(Pictron());

class Pictron extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>
    MaterialApp(
      title: 'Pictron',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const LoginPage(title: 'Pictron'),
    );

}
