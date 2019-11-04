import 'package:flutter_facebook_login/flutter_facebook_login.dart';

enum SingAnswer { successfully, cancelled, error, logOut }

class FacebookSignClient {

  FacebookSignClient() {
    _facebookLogin = FacebookLogin();
  }

  FacebookLogin _facebookLogin;

  Future<SingAnswer> handleSignOut() async {
    await _facebookLogin.logOut();
    return SingAnswer.logOut;
  }

  Future<SingAnswer> handleSignIn() async {

    _facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    final FacebookLoginResult result = await _facebookLogin.logIn(<String>
      ['email']);
    SingAnswer loginAnswer = SingAnswer.error;

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        // send token(result.accessToken) to backend.
        loginAnswer = SingAnswer.successfully;
        break;
      case FacebookLoginStatus.cancelledByUser:
        loginAnswer = SingAnswer.cancelled;
        break;
      case FacebookLoginStatus.error:
        loginAnswer = SingAnswer.error;
        break;
    }
    return loginAnswer;
  }
}
