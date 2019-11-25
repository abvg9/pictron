import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class _EmptyResponse implements Exception {
  @override
  String toString() => 'El Servicio no tiene respuesta.';
}

class _IllegalStatusCode implements Exception {
  @override
  String toString() => 'El Servicio esta fuera de servicio,'
      ' vuelva a intertarlo más tarde.';
}

class Dao {
  Dao() {
    urlAPI = 'https://pictoteask.000webhostapp.com';
    _decoder = const JsonDecoder();
  }

  String urlAPI;
  JsonDecoder _decoder;

  Future<dynamic> post(String url,
          {Map<String, String> headers,
          Map<String, String> body,
          Encoding encoding}) =>
      http
          .post(url, body: body, headers: headers, encoding: encoding)
          .then((http.Response response) {
        final String res = response.body;
        final int statusCode = response.statusCode;

        if (json == null) {
          throw _EmptyResponse();
        } else if (statusCode < 200 || statusCode > 400) {
          throw _IllegalStatusCode();
        }

        return _decoder.convert(res);
      });
}
