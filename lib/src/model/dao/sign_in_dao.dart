import 'package:pictron/src/model/dao/dao.dart';
import 'package:pictron/src/model/transfers/user.dart';

class _UnknownUser implements Exception {
  @override
  String toString() => 'Usuario o contraseña erroneos.';
}

class SignInDao extends Dao {
  SignInDao() {
    _url = '$urlAPI/loginTutor.php';
  }

  String _url;

  Future<User> login(String email, String password) =>
      post(_url, body: <String, String>{'email': email, 'password': password})
          .then((dynamic res) {
        if (res['error_msg'] != null) {
          throw _UnknownUser();
        }

        return User.map(res['tutor']);
      }).catchError((Object e) => throw e);

  Future<User> loginAuth(Object token) =>
      post(_url, body: <String, String>{'idtoken': token.toString()})
          .then((dynamic res) {
        if (res['error_msg'] != null) {
          throw _UnknownUser();
        }

        return User.map(res['tutor']);
      }).catchError((Object e) => throw e);
}
