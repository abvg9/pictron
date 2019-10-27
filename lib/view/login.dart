import 'package:flutter/material.dart';
import 'package:pictron/logic/validation/string_validator.dart';
import 'package:pictron/view/widget/pictron_password_text_field.dart';
import 'package:pictron/view/widget/pictron_text_field.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  StringValidator _stringValidator;
  PictronTextField _emailTextField;
  PictronPasswordTextField _passwordTextField;
  String _errorMessage;

  _LoginPageState() {
    _errorMessage = '';
    _emailTextField = PictronTextField(placeholder: 'Email');
    _passwordTextField = PictronPasswordTextField(placeholder: 'Password');
    _stringValidator = new StringValidator();
  }

  void _checkEmail() {
    setState(() {
      if (!_stringValidator.isEmail(_emailTextField.controller.text.trim())) {
        _errorMessage = "You must provide a valid email.\n";
      } else {
        _errorMessage = "";
      }
    });
  }

  void _checkPass() {
    setState(() {
      if (_passwordTextField.controller.text.isEmpty) {
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
            _emailTextField,
            _passwordTextField,
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
