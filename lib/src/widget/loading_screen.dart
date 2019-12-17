import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
          home: Scaffold(
        body: Center(
            child: Row(
          children: <Widget>[
            Expanded(flex: 2, child: Container()),
            Expanded(
                flex: 3,
                child: Ink.image(
                    image: const AssetImage('assets/loading.png'),
                    fit: BoxFit.contain)),
            Expanded(flex: 2, child: Container()),
          ],
        )),
        backgroundColor: const Color(0xffbcfaff),
      ));
}
