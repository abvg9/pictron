import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookSignClient {

  FacebookSignClient() {
    _facebookLogin = FacebookLogin();
  }

  FacebookLogin _facebookLogin;

  Future<void> handleSignOut() async {
    await _facebookLogin.logOut();
  }

  Future<void> handleSignIn() async {
    _facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    await _facebookLogin.logIn(<String>['email']);
  }
}
