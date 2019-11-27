import 'package:flutter/material.dart';
import 'package:pictron/src/model/transfers/children.dart';
import 'package:pictron/src/model/transfers/children_group.dart';
import 'package:pictron/src/model/validation/string_validator.dart';
import 'package:pictron/src/widgets/text/pictron_text_field.dart';
import 'package:pictron/src/widgets/text/pictron_password_text_field.dart';
import 'package:pictron/src/screens/children_lists.dart';
import 'package:pictron/src/model/auth/facebook/facebook_sign_client.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:pictron/src/model/auth/google/google_sign_client.dart';
import 'package:pictron/src/model/auth/sign_client.dart';
import 'package:pictron/src/controllers/main_controller.dart';
import 'package:progress_dialog/progress_dialog.dart';

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

    _controller = Con();
  }

  StringValidator _stringValidator;

  PictronTextField _emailTextField;
  PictronPasswordTextField _passwordTextField;

  String _emailErrorMessage;
  String _passwordErrorMessage;

  Con _controller;

  ProgressDialog _pr;

  Future<void> _checkAuthLogin(SignClient signClient) async {
    // Send a petition to the API.
    // API will return a list of children's and a list of groups.

    await _controller.signInAuth(signClient);
    if (_controller.signInClient.isConnected()) {
      setState(() {
        final Children harry = Children('HarryPotter86', '1');

        final Children hermione = Children('HermioneGrangerSuper', '2');

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
      });
    }
  }

  Future<void> _checkFields() async {
    final String user = _emailTextField.controller.text.trim();
    final String pass = _passwordTextField.controller.text;

    if (!_stringValidator.isEmail(user)) {
      _emailErrorMessage = 'Debes poner un correo válido.';
    } else {
      _emailErrorMessage = '';
    }

    if (pass.isEmpty) {
      _passwordErrorMessage = 'Debes rellenar el campo contraseña.';
    } else {
      _passwordErrorMessage = '';
    }

    if (_passwordErrorMessage.length + _emailErrorMessage.length == 0) {
      _pr.show();
      try {
        // Send a petition to the API.
        // API will return a list of children's and a list of groups.
        await _controller.signIn(user, pass);
        setState(() {
          _emailErrorMessage = '';
          _pr.hide();
          final Children harry = Children('HarryPotter86', '1');

          final Children hermione = Children('HermioneGrangerSuper', '2');

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
        });
      } catch (e) {
        setState(() {
          _pr.hide();
          _emailErrorMessage = e.toString();
        });
      }
    } else {
      setState(() {});
    }
  }

  void _goToChildViewList(List<Children> children, List<ChildrenGroup> groups) {
    Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
          builder: (BuildContext context) =>
              ChildList(children: children, childrenGroups: groups)),
    );
  }

  GoogleSignClient google;

  @override
  Widget build(BuildContext context) {
    _pr = ProgressDialog(context)
      ..style(
          message: 'Conectando',
          borderRadius: 10,
          backgroundColor: Colors.white,
          progressWidget: Container(
            constraints: const BoxConstraints(maxHeight: 40, maxWidth: 40),
            child: const CircularProgressIndicator(),
          ),
          insetAnimCurve: Curves.easeInOut,
          progressTextStyle: TextStyle(
              color: Colors.cyanAccent[100],
              fontSize: 13,
              fontWeight: FontWeight.w400),
          messageTextStyle: TextStyle(
              color: Colors.black, fontSize: 19, fontWeight: FontWeight.w600));
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
              MaterialButton(
                height: 35,
                minWidth: 225,
                color: Colors.blueAccent,
                onPressed: _checkFields,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.white)),
                child: const Text('INICIAR SESIÓN',
                    style: TextStyle(color: Colors.white)),
              ),
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
                onPressed: () async {
                  await _checkAuthLogin(GoogleSignClient());
                },
                text: 'Inicia sesión con Google',
                padding: const EdgeInsets.only(right: 10),
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
                padding: const EdgeInsets.only(right: 10),
                onPressed: () async {
                  await _checkAuthLogin(FacebookSignClient());
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
