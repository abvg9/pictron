import 'dart:convert';
import 'package:http/http.dart' as http;

class EmptyResponse implements Exception {
  @override
  String toString() => 'El servidor no responde.';
}

class Dao {
  Dao() {
    urlAPI = 'https://pictoteask.000webhostapp.com';
    decoder = const JsonDecoder();
  }

  String urlAPI;
  JsonDecoder decoder;

  Future<dynamic> post(String url,
      {Map<String, String> headers,
        Map<String, String> body,
        Encoding encoding}) => http
      .post(url, body: body, headers: headers, encoding: encoding)
      .then((http.Response response) {
    final String res = response.body;
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw EmptyResponse();
    }
    return decoder.convert(res);
  });

  Future<dynamic> get(String url) =>
      http.get(url).then((http.Response response) {
        final String res = response.body;
        final int statusCode = response.statusCode;

        if (statusCode < 200 || statusCode > 400 || json == null) {
          throw EmptyResponse();
        }

        return decoder.convert(res);
      });
}
