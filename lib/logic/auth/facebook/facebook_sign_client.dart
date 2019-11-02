import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter/material.dart';

enum LoginAnswer { successfully, cancelled, error, logOut }

class FacebookSignClient extends StatefulWidget {
  const FacebookSignClient({Key key, this.title}) : super(key: key);

  @override
  _FacebookSignClientState createState() => _FacebookSignClientState();

  final String title;
}

class _FacebookSignClientState extends State<FacebookSignClient> {
  _FacebookSignClientState() {
    _facebookLogin = FacebookLogin();
    _infoMessage = LoginAnswer.successfully;
  }

  FacebookLogin _facebookLogin;
  FacebookLoginResult _result;
  FacebookAccessToken _token;
  LoginAnswer _infoMessage;

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
            onPressed: _logInFacebook,
            child: const Text('Log In'),
          ),
          RaisedButton(
            onPressed: _logOutFacebook,
            child: const Text('Log Out'),
          ),
          Text(_infoMessage.toString()),
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

  void _logOutFacebook() {
    _facebookLogin.logOut();
    setState(() {
      _infoMessage = LoginAnswer.logOut;
    });
  }

  Future<void> _logInFacebook() async {
    _facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    _result = await _facebookLogin.logIn(<String>['email']);

    setState(() {
      switch (_result.status) {
        case FacebookLoginStatus.loggedIn:
          _infoMessage = LoginAnswer.successfully;
          break;
        case FacebookLoginStatus.cancelledByUser:
          _infoMessage = LoginAnswer.cancelled;
          break;
        case FacebookLoginStatus.error:
          _infoMessage = LoginAnswer.error;
          break;
      }
      _token = _result.accessToken;
    });
  }
}
