import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class EmptyResponse implements Exception {
  @override
  String toString() => 'El servidor no responde.';
}

class Dao {
  Dao() {
    urlAPI = 'https://www.tea-helper.es/api';
    decoder = const JsonDecoder();
  }

  String urlAPI;
  JsonDecoder decoder;

  Future<HttpClientResponse> post(String url,
      {Map<String, String> headers,
      Map<String, String> body,
      Encoding encoding}) async {
    final HttpClient httpClient = HttpClient();

    final HttpClientRequest request =
        await httpClient.postUrl(Uri.parse(url)).catchError((Object e) {});

    // Add headers.
    headers.forEach((String key, String value) {
      request.headers.set(key, value);
    });

    // Add body.
    request.add(utf8.encode(json.encode(body)));

    return request.close();
  }

  Future<dynamic> get(String url) =>
      http.get(url).then((http.Response response) {
        final String res = response.body;
        final int statusCode = response.statusCode;

        return decoder.convert(res);
      });
}
