import 'package:intl/intl.dart';
import 'package:pictron/src/model/dao/dao.dart';
import 'package:pictron/src/model/transfers/activity.dart';

class _EmptyActivityList implements Exception {
  @override
  String toString() => 'El niño no tiene ninguna tarea para hoy, '
      'si deseas añadirle tareas accede a la web para añadirselas.';
}

class CalendarDao extends Dao {
  CalendarDao() {
    _urlActivities = '$urlAPI/getTaskDate.php';
    _urlSubActivities = '$urlAPI/getSubTask.php';
  }

  String _urlActivities;
  String _urlSubActivities;

  Future<List<Activity>> getActivities(String id) =>
      post(_urlActivities, body: <String, String>{
        'date': DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
        'id_nino': id
      }).then((dynamic response) async {
        if (response == null) {
          throw EmptyResponse();
        }

        final List<dynamic> activityList = response['Tareas'] as List<dynamic>;

        final List<Activity> activities = activityList
            .map<Activity>((dynamic json) => Activity.fromJson(json, urlAPI))
            .toList();

        if (activities.isEmpty) {
          throw _EmptyActivityList();
        }

        for (final Activity a in activities) {
          a.subActivities = await _getSubActivities(a.getId());
        }

        return activities;
      }).catchError((Object e) => throw e);

  Future<List<Activity>> _getSubActivities(String id) =>
      post(_urlSubActivities, body: <String, String>{'id_task': id})
          .then((dynamic response) async {
        if (response == null) {
          throw EmptyResponse();
        }

        final List<dynamic> activityList =
            response['subtareas'] as List<dynamic>;

        return activityList
            .map<Activity>(
                (dynamic json) => Activity.subActivityFromJson(json, urlAPI))
            .toList();
      }).catchError((Object e) => throw e);
}
