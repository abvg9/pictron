import 'package:flutter/material.dart';
import 'package:pictron/logic/validation/string_validator.dart';
import 'package:pictron/view/widget/text/pictron_password_text_field.dart';
import 'package:pictron/view/widget/text/pictron_text_field.dart';
import 'package:pictron/view/widget/button/pictron_base_button.dart';

class Register extends StatefulWidget {
  const Register({Key key, this.title}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();

  final String title;
}

class _RegisterState extends State<Register> {
  _RegisterState() {
    _errorMessage = '';
    _emailTextField = PictronTextField(placeholder: 'Email');
    _passwordTextField = PictronPasswordTextField(placeholder: 'Password');
    _stringValidator = StringValidator();
    _registerButton = PictronBaseButton(
        text: 'Register',
        onPressed: _checkFields,
        textStyle: TextStyle(color: Colors.green));
  }

  StringValidator _stringValidator;

  PictronTextField _emailTextField;
  PictronPasswordTextField _passwordTextField;

  String _errorMessage;

  PictronBaseButton _registerButton;

  void _checkFields() {
    final StringBuffer errors = StringBuffer();
    if (!_stringValidator.isEmail(_emailTextField.controller.text.trim())) {
      errors.writeln('You must provide a valid email.');
    }
    if (_passwordTextField.controller.text.isEmpty) {
      errors.writeln('You must provide a password.');
    }
    setState(() {
      if (errors.length != 0) {
        _errorMessage = errors.toString();
      } else {
        // Send a petition to the API.
        // If the API responds with an affirmative answer, we go back to the
        // login view.
        Navigator.pop(context);
      }
    });
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
              _registerButton,
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
