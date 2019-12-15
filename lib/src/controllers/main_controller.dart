import 'package:mvc_pattern/mvc_pattern.dart' show ControllerMVC;
import 'package:pictron/src/model/auth/sign_client.dart';
import 'package:pictron/src/model/dao/children_dao.dart';
import 'package:pictron/src/model/dao/sign_in_dao.dart';
import 'package:pictron/src/model/transfers/user.dart';

class Con extends ControllerMVC {
  factory Con() => _this ??= Con._();

  Con._();

  static Con _this;

  // For easy access in the application
  static Con get con => _this;

  static User _user;

  SignClient signInClient;

  final SignInDao _signInDao = SignInDao();
  final ChildrenDao _childrenDao = ChildrenDao();

  Future<void> signIn(String email, String pass) async {
    try {
      final String id = await _signInDao.login(email, pass);

      _user = User(id, await _childrenDao.getChildren(id),
          await _childrenDao.getGroups(id));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signInAuth(SignClient signClient) async {
    signInClient = signClient;

    try {
      // If user is signed in we sign out.
      if (await signClient.isConnected().then((bool con) => con)) {
        await signClient.handleSignOut();
      }

      await signInClient.handleSignIn();

      //TO-DO

    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOutAuth() async {
    await signInClient.handleSignOut();
  }

  User getUser() => _user;
}
