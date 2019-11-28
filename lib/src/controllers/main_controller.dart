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

  Future<void> signIn(String email, String pass) async {
    final SignInDao signInDao = SignInDao();

    await signInDao.login(email, pass).then((User u) {
      model = u;
    }).catchError((Object e) => throw e);
  }

  Future<void> signInAuth(SignClient signClient) async {

    signInClient = signClient;

    await signInClient.handleSignIn().catchError((Object e) => throw e);

    signClient.getToken();

    //final SignInDao signInDao = SignInDao();

    //await signInDao.loginAuth(signClient.getToken()).then((User u) {
    //model = u;
    //}).catchError((Object e) => throw e);
  }

  Future<void> signOutAuth() async {
    await signInClient.handleSignOut();
  }
}
