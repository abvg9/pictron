import 'package:flutter/material.dart';
import 'package:pictron/src/model/transfers/activity.dart';
import 'package:pictron/src/controllers/main_controller.dart';

class SubTasks extends StatefulWidget {
  const SubTasks({Key key, this.activities}) : super(key: key);

  @override
  _SubTasksState createState() => _SubTasksState(activities: activities);

  final List<Activity> activities;
}

class _SubTasksState extends State<SubTasks> {
  _SubTasksState({this.activities, this.activitiesToShow}) {
    _controller = Con();
  }

  Con _controller;
  List<Activity> activities;
  List<Activity> activitiesToShow;
  ListView _activitiesList;

  ListView _loadCalendar() => ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: activitiesToShow.length,
        itemBuilder: (BuildContext c, int index) => Padding(
            padding: const EdgeInsets.all(30),
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
                          Text(activitiesToShow[index].getTitle(),
                              style:
                                  TextStyle(fontSize: 40, color: Colors.black)),
                          Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(
                                  activitiesToShow[index].getUrlImg()),
                            )),
                          ),
                        ],
                      )),
                ),
              ],
            )),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(
        child: Column(
          children: <Widget>[
            Flexible(
              child: _activitiesList,
            ),
          ],
        ),
      ));
}
