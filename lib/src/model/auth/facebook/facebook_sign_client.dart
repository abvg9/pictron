import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:pictron/src/model/auth/sign_client.dart';

class FacebookSignClient extends SignClient {
  FacebookSignClient() {
    _facebookLogin = FacebookLogin();
    connected = false;
  }

  FacebookLogin _facebookLogin;

  @override
  Future<void> handleSignOut() async {
    await _facebookLogin.logOut();
    connected = false;
  }

  @override
  Future<void> handleSignIn() async {
    _facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    connected = await _facebookLogin
        .logIn(<String>['email']).then((FacebookLoginResult flr) {
      if (flr.status == FacebookLoginStatus.loggedIn) {
        return true;
      }
      return false;
    });
    token = await _facebookLogin.currentAccessToken
        .then((FacebookAccessToken fat) => fat.token);
  }
}
