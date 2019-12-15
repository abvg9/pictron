import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:pictron/src/model/auth/sign_client.dart';

class FacebookSignClient extends SignClient {
  FacebookSignClient() {
    _facebookLogin = FacebookLogin();
  }

  FacebookLogin _facebookLogin;

  @override
  Future<void> handleSignOut() async {
    await _facebookLogin.logOut().catchError((Object e) {
      throw AuthError('Facebook');
    });
  }

  @override
  Future<void> handleSignIn() async {
    _facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;

    await _facebookLogin
        .logIn(<String>['email']).then((FacebookLoginResult flr) {
      if (flr.status != FacebookLoginStatus.loggedIn) {
        throw InvalidCredentials('Facebook');
      }
    });
  }

  @override
  Future<String> getToken() async => _facebookLogin.currentAccessToken
          .then((FacebookAccessToken fat) => fat.token)
          .catchError((Object e) {
        throw AuthError('Facebook');
      });

  @override
  Future<bool> isConnected() =>
      _facebookLogin.isLoggedIn.then((bool con) => con).catchError((Object e) {
        throw AuthError('Facebook');
      });
}
