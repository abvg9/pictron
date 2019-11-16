import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'package:pictron/src/controllers/main_controller.dart';
import 'package:pictron/src/screens/test_screen.dart';

class App extends AppMVC {
  App({Key key}) : super(con: _controller, key: key);
  static final Con _controller = Con();

  static MaterialApp _app;

  static String get title => _app.title.toString();

  @override
  Widget build(BuildContext context) => _app = MaterialApp(
        title: 'Pictron',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TestScreen(),
      );
}
