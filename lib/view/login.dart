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
    Widget container = Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(controller: _emailController, decoration: InputDecoration(
              hintText: "Email"
            ),),
            TextField(obscureText: true, controller: _passController, decoration: InputDecoration(
              hintText: "Password"
            ),),
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
      constraints: BoxConstraints(maxHeight: 400, maxWidth: 400),
      padding: EdgeInsets.all(10),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: container),
    );
  }
}
