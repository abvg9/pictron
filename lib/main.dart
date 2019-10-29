import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'view/login.dart';

void main() => runApp(Pictron());

class Pictron extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.landscapeLeft,
    ]);
    return MaterialApp(
      title: 'Pictron',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const LoginPage(title: 'Pictron'),
    );
  }
}
