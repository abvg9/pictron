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

  Activity.fromJson(dynamic json, String pathToImg) {
    id = json['id_tarea'].toString();
    start = _parseTime(json['hora_inicio'].toString());
    end = _parseTime(json['hora_fin'].toString());
    title = json['texto'].toString();
    urlImg = json['path_picto'].toString();
    urlImg = pathToImg + urlImg;
    type = Type.values.firstWhere(
        (Type t) => t.toString().split('.').last == json['tipo'].toString());
    link = json['enlace'].toString();
  }

  Activity.subActivityFromJson(dynamic json, String pathToImg) {
    id = json['id_subtarea'].toString();
    urlImg = json['path_pictrograma'].toString();
    urlImg = pathToImg + urlImg;
    title = json['texto'].toString();
  }

  DateTime _parseTime(String time) {
    final DateTime now = DateTime.now();
    final List<String> hours = time.split(':');

    return DateTime(
        now.year, now.month, now.day, int.parse(hours[0]), int.parse(hours[1]));
  }

  String id;
  DateTime start;
  DateTime end;
  String title;
  String urlImg;
  Type type;
  List<Activity> subActivities;
  String link;

  String getId() => id;
  DateTime getStart() => start;
  DateTime getEnd() => end;
  String getTitle() => title;
  String getUrlImg() => urlImg;
  String getLink() => link;
  Type getType() => type;
  List<Activity> getSubActivities() => subActivities;
}
