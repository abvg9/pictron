import 'package:flutter/material.dart';
import 'package:pictron/src/model/transfers/activity.dart';
import 'package:pictron/src/controllers/main_controller.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key key, this.activities, this.id, this.activitiesToShow})
      : super(key: key);

  @override
  _CalendarState createState() => _CalendarState(
      activities: activities, id: id, activitiesToShow: activitiesToShow);

  final List<Activity> activities;
  final List<Activity> activitiesToShow;
  final String id;
}

class _CalendarState extends State<Calendar> {
  _CalendarState({this.activities, this.id, this.activitiesToShow}) {
    _controller = Con();
    _activitiesList = _loadCalendar();
  }

  Con _controller;
  List<Activity> activities;
  List<Activity> activitiesToShow;
  String id;
  ListView _activitiesList;

  Future<bool> _updateList() async {
    //final List<Activity> activities = await _controller.loadCalendar(id);
    final DateTime now = DateTime.now();
    final List<Activity> pendingRemove = <Activity>[];
    const Duration tenMinutes = Duration(minutes: 10);

    // Discard last activities with a lapse of 10 minutes.
    for (final Activity a in activities) {
      if (a.getEnd().difference(now) <= tenMinutes) {
        pendingRemove.add(a);
      }
    }

    // Remove pending elements.
    pendingRemove.forEach(activities.remove);

    activitiesToShow.clear();
    for (int i = 0; (i < 3) && (i < activities.length); i++) {
      activitiesToShow.add(activities[i]);
    }

    setState(() {
      if (activitiesToShow.isNotEmpty) {
        _activitiesList = _loadCalendar();
      }
    });

    return activitiesToShow.isEmpty;
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Ups!'),
              content:
                  const Text('Este niño ya no tiene ninguna actividad más a lo'
                      ' largo del día.'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cerrar'),
                ),
              ],
            ));
  }

  ListView _loadCalendar() => ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: activitiesToShow.length,
        itemBuilder: (BuildContext c, int index) => Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                      onTap: () {
                        // If the task has sub-tasks we need to show it.
                        if (activitiesToShow[index]
                            .getSubActivities()
                            .isNotEmpty) {}
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(
                                  activitiesToShow[index].getUrlImg()))),
                          ),
                          const SizedBox(height: 10),
                          Text(activitiesToShow[index].getTitle(),
                              style:
                              TextStyle(fontSize: 40, color: Colors.black)),
                        ],
                      )
                  ),
                ),
              ],
            )),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.transparent,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.refresh),
                    color: Colors.black,
                    iconSize: 80,
                    onPressed: () async {
                      await _updateList().then((bool ret) {
                        if (!ret) {
                          _showDialog();
                          Navigator.pop(this.context, true);
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            Flexible(
              child: _activitiesList,
            ),
          ],
        ),
      ));
}
