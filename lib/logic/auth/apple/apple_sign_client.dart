import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:apple_sign_in/apple_sign_in.dart';

enum LoginAnswer { successfully, cancelled, error, logOut }

class AppleSignClient extends StatefulWidget {
  const AppleSignClient({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AppleSign createState() => _AppleSign();
}

class _AppleSign extends State<AppleSignClient> {

  AuthorizationResult _result;
  LoginAnswer _loginResult;

  Future<void> logIn() async {
    _result = await AppleSignIn.performRequests(<AppleIdRequest>[
      AppleIdRequest(requestedScopes: <Scope>[Scope.email, Scope.fullName])
    ]);

    switch (_result.status) {
      case AuthorizationStatus.authorized:
        _loginResult = LoginAnswer.successfully;
        break;

      case AuthorizationStatus.error:
        _loginResult = LoginAnswer.error;
        break;

      case AuthorizationStatus.cancelled:
        _loginResult = LoginAnswer.cancelled;
        break;
    }
  }

  Future<void> logOut() async {
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
          RaisedButton(
            onPressed: logIn,
            child: const Text('Log In'),
          ),
          RaisedButton(
            onPressed: logOut,
            child: const Text('Log Out'),
          ),
          Text(_loginResult.toString()),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facebook login'),
      ),
      body: Center(child: container),
    );
  }
}