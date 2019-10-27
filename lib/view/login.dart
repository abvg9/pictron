import 'package:flutter/material.dart';
import 'package:pictron/logic/validation/string_validator.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final StringValidator _stringValidator = new StringValidator();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();

  String _errorMessage = "";

  void _checkEmail() {
    setState(() {
      if (!_stringValidator.isEmail(_emailController.text.trim())) {
        _errorMessage = "You must provide a valid email.\n";
      } else {
        _errorMessage = "";
      }
    });
  }

  void _checkPass() {
    setState(() {
      if (_passController.text.isEmpty) {
        _errorMessage += "You must provide a password.\n";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Email'),
            TextField(controller: _emailController),
            Text('Password'),
            TextField(obscureText: true, controller: _passController),
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    onPressed: () {
                      _checkEmail();
                      _checkPass();
                    },
                    child:
                        Text("Log in", style: TextStyle(color: Colors.green)))
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _checkEmail();
          _checkPass();
        },
        child: Icon(Icons.account_box),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
