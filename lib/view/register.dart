import 'package:flutter/material.dart';
import 'package:pictron/view/widget/button/pictron_base_button.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget container = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[],
      ),
      constraints: BoxConstraints(maxHeight: 400, maxWidth: 400),
      padding: EdgeInsets.all(10),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Center(child: container),
    );
  }
}
