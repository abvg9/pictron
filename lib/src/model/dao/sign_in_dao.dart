import 'dart:convert';
import 'dart:io';
import 'package:pictron/src/model/dao/dao.dart';
import 'package:pictron/src/model/transfers/user.dart';

class _UnknownUser implements Exception {
  @override
  String toString() => 'Usuario o contraseña erroneos.';
}

class SignInDao extends Dao {
  SignInDao() {
    _url = '$urlAPI/auth/login';
  }

  String _url;

  Future<String> login(String email, String password) =>
      post(_url, body: <String, String>{
        'email': email,
        'password': password
      }, headers: <String, String>{
        'accept': 'application/json',
        'Content-Type': 'application/json'
      }).then((HttpClientResponse response) async {
        final String reply = await response.transform(utf8.decoder).join();

        switch (response.statusCode) {
          case 403:
            throw _UnknownUser();
        }

        if (reply == null) {
          throw EmptyResponse();
        }

        return jsonDecode(reply)['token'].toString();
      }).catchError((Object e) => throw e);

  Future<void> loginAuth(String token) =>
      post(_url, body: <String, String>{'idtoken': token}).then((dynamic res) {
        if (res['error_msg'] != null) {
          throw _UnknownUser();
        }

        return User.map(res['tutor']);
      }).catchError((Object e) => throw e);
}
