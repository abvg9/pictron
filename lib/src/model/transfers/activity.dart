import 'package:flutter/cupertino.dart';

enum Type { tarea, cuento, juego }

class Activity {
  Activity(
      {@required this.id,
      @required this.start,
      @required this.end,
      @required this.title,
      @required this.urlImg,
      @required this.type,
      @required this.subActivities});

  Activity.fromJson(dynamic json) {
    id = json['id_tarea'].toString();
    start = json['hora_inicio'].toString();
    end = json['hora_fin'].toString();
    title = json['texto'].toString();
    urlImg = json['path_picto'].toString();
    type = Type.values.firstWhere(
        (Type t) => t.toString().split('.').last == json['tipo'].toString());
  }

  Activity.subActivityFromJson(dynamic json) {
    id = json['id_subtarea'].toString();
    urlImg = json['path_pictrograma'].toString();
    title = json['texto'].toString();
  }

  String id;
  String start;
  String end;
  String title;
  String urlImg;
  Type type;
  List<Activity> subActivities;

  String getTitle() => title;
  String getId() => id;
  List<Activity> getSubActivities() => subActivities;
}
