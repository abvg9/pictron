import 'package:pictron/src/model/dao/dao.dart';

class _UnknownUser implements Exception {
  @override
  String toString() => 'Usuario o contraseña erroneos.';
}

class SignInDao extends Dao {
  SignInDao() {
    _url = '$urlAPI/loginTutor.php';
  }

  String _url;

  Future<String> login(String email, String password) =>
      post(_url, body: <String, String>{'email': email, 'password': password})
          .then((dynamic response) async {
        if (response == null) {
          throw EmptyResponse();
        }

        if (response['error_msg'] != null) {
          throw _UnknownUser();
        }

        return response['tutor']['id_tutor'].toString();
      }).catchError((Object e) => throw e);

  void loginAuth(String token) {
    // TO-DO
  }
}
