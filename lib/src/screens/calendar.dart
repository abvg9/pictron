import 'package:flutter/material.dart';
import 'package:pictron/src/model/transfers/activity.dart';
import 'package:pictron/src/screens/game_screen.dart';
import 'package:pictron/src/screens/story_screen.dart';
import 'package:pictron/src/screens/sub_tasks.dart';
import 'package:pictron/src/controllers/main_controller.dart';
import 'package:pictron/src/model/transfers/story_transfer.dart';

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
    _activitiesList = _loadCalendar();
  }

  List<Activity> activities;
  List<Activity> activitiesToShow;
  String id;
  ListView _activitiesList;

  Future<bool> _updateList() async {
    activities = await Con.con.loadCalendar(id);
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

  void _goToSubTasks(List<Activity> activities) {
    Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
          builder: (BuildContext context) =>
              SubTasks(activities: activities)),
    );
  }

  void _goToStory(String id)  {
     Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
          builder: (BuildContext context) =>
              StoryScreen()),
    );
  }

  void _goToGame(String id) {
    Con.con.setGameId(int.parse(id));
    Navigator.push(
      context,
      MaterialPageRoute<dynamic>(
          builder: (BuildContext context) =>
              GameScreen()),
    );
  }

  ListView _loadCalendar() => ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: activitiesToShow.length,
      itemBuilder: (BuildContext c, int index) => Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: GestureDetector(
                    onTap: () {
                        switch(activitiesToShow[index].getType()) {
                          case Type.tarea:
                            if (activitiesToShow[index].getSubActivities()
                                .isNotEmpty) {
                              _goToSubTasks(
                                  activitiesToShow[index].getSubActivities());
                            }
                            break;
                          case Type.cuento:
                            _goToStory(activitiesToShow[index].getLink());
                            break;
                          case Type.juego:
                            _goToGame(activitiesToShow[index].getId());
                            break;

                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          height: (MediaQuery.of(context).size.height /
                                  activitiesToShow.length) - 20,
                          width: (MediaQuery.of(context).size.width /
                                  activitiesToShow.length) - 20,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      activitiesToShow[index].getUrlImg()))
                          ),
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
          ));

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40),
            Column(
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
