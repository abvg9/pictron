import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

//enum Answers {}

class HttpHandler {

  Future<_Post> fetchPost() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');

    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      final itemCount = jsonResponse['totalItems'];
      return _Post();
    } else {
      // Error
    }
  }

}

class _Post {
  _Post({this.userId, this.id, this.title, this.body});

  final dynamic userId;
  final dynamic id;
  final dynamic title;
  final dynamic body;

  factory _Post.fromJson(Map<String, dynamic> json) =>
      _Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );


}
