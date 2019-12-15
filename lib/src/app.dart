import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:pictron/src/controllers/main_controller.dart';
import 'package:pictron/src/screens/login.dart';

class App extends AppMVC {
  App({Key key}) : super(con: _controller, key: key);
  static final Con _controller = Con();

  static MaterialApp _app;

  static String get title => _app.title.toString();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIOverlays(<SystemUiOverlay>[]);
    return _app = MaterialApp(
      title: 'PictoTEAsk',
      theme: ThemeData(
        canvasColor: Colors.cyan[100],
      ),
      home: const LoginPage(),
    );
  }
}
