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
      post(_url, body: <String, String>{
        'email': email,
        'password': password
      }).then((dynamic response) async {

        if (response == null) {
          throw EmptyResponse();
        }

        if(response['error_msg'] != null){
          throw _UnknownUser();
        }

        return User.map(response);
      }).catchError((Object e) => throw e);

  Future<void> loginAuth(String token) =>
      post(_url, body: <String, String>{'idtoken': token}).then((dynamic res) {

        if (res['error_msg'] != null) {
          throw _UnknownUser();
        }

        return User.map(res['tutor']);
      }).catchError((Object e) => throw e);
}