import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:pictron/src/model/auth/sign_client.dart';

class FacebookSignClient extends SignClient {
  FacebookSignClient() {
    _facebookLogin = FacebookLogin();
  }

  FacebookLogin _facebookLogin;

  @override
  Future<void> handleSignOut() async {
    await _facebookLogin.logOut();
  }

  @override
  Future<void> handleSignIn() async {
    _facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    await _facebookLogin.logIn(<String>['email']);
    token = await _facebookLogin.currentAccessToken
        .then((FacebookAccessToken fat) => fat.token);
  }
}
