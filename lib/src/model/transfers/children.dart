import 'package:flutter/cupertino.dart';

class Child {
  Child({@required this.nick, @required this.id});

  factory Child.fromJson(dynamic json) =>
      Child(id: json['id_kid'].toString(), nick: json['nick'].toString());

  String nick;
  String id;

  String getNick() => nick;
  String getId() => id;
}
