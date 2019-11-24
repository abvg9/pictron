import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:pictron/src/controllers/main_controller.dart';
import 'package:pictron/src/model/Transfers/children.dart';
import 'package:pictron/src/model/Transfers/children_group.dart';
import 'package:pictron/src/model/validation/string_validator.dart';
import 'package:pictron/src/widgets/text/pictron_text_field.dart';
import 'package:pictron/src/widgets/text/pictron_password_text_field.dart';
import 'package:pictron/src/screens/children_lists.dart';
import 'package:pictron/src/model/auth/facebook/facebook_sign_client.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:pictron/src/model/auth/google/google_sign_client.dart';
import 'package:pictron/src/model/auth/sign_client.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _LoginPageState() {
    _emailErrorMessage = '';
    _passwordErrorMessage = '';

    _emailTextField = PictronTextField(placeholder: 'email@email.email');
    _passwordTextField = PictronPasswordTextField(placeholder: 'Contraseña');

    _stringValidator = StringValidator();
  }

  StringValidator _stringValidator;

  PictronTextField _emailTextField;
  PictronPasswordTextField _passwordTextField;

  String _emailErrorMessage;
  String _passwordErrorMessage;

  SignClient _signClient;

  void _checkFields() {
    if (!_stringValidator.isEmail(_emailTextField.controller.text.trim())) {
      _emailErrorMessage = 'Debes poner un correo válido.';
    } else {
      _emailErrorMessage = '';
    }

    if (_passwordTextField.controller.text.isEmpty) {
      _passwordErrorMessage = 'Debes rellenar el campo contraseña.';
    } else {
      _passwordErrorMessage = '';
    }

    setState(() {
      if (_passwordErrorMessage.length + _emailErrorMessage.length == 0) {
        // Send a petition to the API.

        // API will return a list of children's and a list of groups.

        final Children harry = Children(
            'HarryPotter86',
            'https://assets.afcdn.com/story/20170626/'
                '1099098_w767h767c1cx853cy523cxt0cyt0cxb1600cyb1201.jpg');

        final Children hermione = Children(
            'HermioneGrangerSuper',
            'https://imgix.bustle.com/rehost/2016/9/13/'
                'df278a16-44e9-4553-80ef-a23966f6d367.jpg'
                '?w=970&h=546&fit=crop&crop=faces&auto=format&q=70');

        final List<Children> children = <Children>[
          harry,
          hermione,
          harry,
          hermione,
          harry,
        ];

        final ChildrenGroup group1 =
            ChildrenGroup('Primer ciclo primaria', children);

        final ChildrenGroup group2 =
            ChildrenGroup('Segundo ciclo primaria', children);

        final List<ChildrenGroup> groups = <ChildrenGroup>[group1, group2];

        _goToChildViewList(children, groups);
      }
    });
  }

  void _goToChildViewList(List<Children> children, List<ChildrenGroup> groups) {
    Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
          builder: (BuildContext context) =>
              ChildList(children: children, childrenGroups: groups)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget container = Container(
      constraints: const BoxConstraints(maxHeight: 540, maxWidth: 540),
      padding: const EdgeInsets.only(right: 40, left: 40),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: ListView(
        children: <Widget>[
          const Text('Inicio de sesión',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'KaushanScript',
                fontSize: 60,
              )),
          const SizedBox(height: 30),
          Container(
            child: Row(children: const <Widget>[
              Text(
                'Email',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          const SizedBox(height: 10),
          Container(
            height: 50,
            child: _emailTextField,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Text(
                  _emailErrorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            child: Row(
              children: const <Widget>[
                Text(
                  'Contraseña',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 50,
            child: _passwordTextField,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Text(
                  _passwordErrorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SignInButtonBuilder(
                text: 'Inicia sesion con tu correo',
                icon: Icons.email,
                onPressed: _checkFields,
                backgroundColor: Colors.blue[700],
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 100, right: 10),
                  child: Divider(
                    color: Colors.black,
                    height: 10,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text('o'),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 100),
                  child: Divider(
                    color: Colors.black,
                    height: 10,
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SignInButton(
                Buttons.Google,
                onPressed: () {
                  _signClient = GoogleSignClient()..handleSignIn();
                },
                text: 'Inicia sesión con Google',
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.white)),
              )
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SignInButton(
                Buttons.Facebook,
                text: 'Inicia sesión con Facebook',
                onPressed: () {
                  _signClient = FacebookSignClient()..handleSignIn();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.white)),
              )
            ],
          )
        ],
      ),
    );
    return Scaffold(
      body: Center(child: container),
    );
  }
}
