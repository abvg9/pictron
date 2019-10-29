import 'package:flutter/material.dart';
import 'package:pictron/logic/validation/string_validator.dart';
import 'package:pictron/view/widget/text/pictron_password_text_field.dart';
import 'package:pictron/view/widget/text/pictron_text_field.dart';
import 'package:pictron/view/widget/button/pictron_base_button.dart';
import 'package:pictron/view/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key, this.title}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();

  final String title;
}

class _LoginPageState extends State<LoginPage> {

  _LoginPageState() {
    _errorMessage = '';
    _emailTextField = PictronTextField(placeholder: 'Email');
    _passwordTextField = PictronPasswordTextField(placeholder: 'Password');
    _stringValidator = StringValidator();

    _logInButton = PictronBaseButton(
        text: 'Log in',
        function: _checkFields,
        textStyle: TextStyle(color: Colors.green));
    _regInButton = PictronBaseButton(
        text: 'Register',
        function: _goToRegister,
        textStyle: TextStyle(color: Colors.green));
  }

  StringValidator _stringValidator;

  PictronTextField _emailTextField;
  PictronPasswordTextField _passwordTextField;

  String _errorMessage;

  PictronBaseButton _logInButton;
  PictronBaseButton _regInButton;

  void _checkFields() {
    final StringBuffer errors = StringBuffer();
    if (!_stringValidator.isEmail(_emailTextField.controller.text.trim())) {
      errors.writeln('You must provide a valid email.');
    }
    if (_passwordTextField.controller.text.isEmpty) {
      errors.writeln('You must provide a password.');
    }
    setState(() {
      _errorMessage = errors.toString();
    });
  }

  void _goToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute<dynamic>(builder: (BuildContext context) => Register()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget container = Container(
      constraints: const BoxConstraints(maxHeight: 400, maxWidth: 400),
      padding: const EdgeInsets.all(10),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _logInButton,
              _regInButton,
            ],
          )
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: container),
    );
  }
}
