import 'package:mvc_pattern/mvc_pattern.dart' show ControllerMVC;
import 'package:pictron/src/model/auth/sign_client.dart';
import 'package:pictron/src/model/dao/sign_in_dao.dart';
import 'package:pictron/src/model/transfers/user.dart';
//import 'package:pictron/src/app.dart' show App;

class Con extends ControllerMVC {
  factory Con() => _this ??= Con._();

  Con._();

  static Con _this;

  // For easy access in the application
  static Con get con => _this;

  static User model;

  SignClient signInClient;

  final SignInDao _signInDao = SignInDao();

  Future<void> signIn(String email, String pass) async {
    await _signInDao.login(email, pass).catchError((Object e) => throw e);
    // Now we need to send to the API our given token.
  }

  Future<void> signInAuth(SignClient signClient) async {

    signInClient = signClient;

    try {

      // If user is signed in we sign out.
      if (await signClient.isConnected().then((bool con) => con)) {
        await signClient.handleSignOut();
      }

      await signInClient.handleSignIn();

      //final SignInDao signInDao = SignInDao();

      //await signInDao.loginAuth(signClient.getToken()).then((User u) {
      //model = u;
      //}).catchError((Object e) => throw e);
      
    }catch (e) {
      rethrow;
    }
  }

  Future<void> signOutAuth() async {
    await signInClient.handleSignOut();
  }
}
