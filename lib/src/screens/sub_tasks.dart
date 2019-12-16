import 'package:flutter/material.dart';
import 'package:pictron/src/model/transfers/activity.dart';
import 'package:pictron/src/widget/arrow_button.dart';
import 'package:pictron/src/widget/visibility.dart';
import 'package:pictron/src/widget/secret_button.dart';

class SubTasks extends StatefulWidget {
  const SubTasks({Key key, this.activities}) : super(key: key);

  @override
  _SubTasksState createState() => _SubTasksState(activities: activities);

  final List<Activity> activities;
}

class _SubTasksState extends State<SubTasks> {
  _SubTasksState({this.activities}) {

    _index = 0;
    _leftArrowVi = VisibilityFlag.invisible;

    if(activities.length > 3){
      _rightArrowVi = VisibilityFlag.visible;
    } else {
      _rightArrowVi = VisibilityFlag.invisible;
    }

    activitiesToShow = <Activity> [];
    int count = 0;
    for(int i = _index; (count < 3) && (i < activities.length); i++){
      activitiesToShow.add(activities[i]);
      count++;
    }

    _activitiesList = _loadCalendar();
  }

  List<Activity> activities;
  List<Activity> activitiesToShow;
  ListView _activitiesList;
  VisibilityFlag _leftArrowVi;
  VisibilityFlag _rightArrowVi;
  GestureTapCallback _firstSecretOnTap;
  GestureTapCallback _secondSecretOnTap;
  PasswordTwoButtons password = PasswordTwoButtons();
  int _index;

  /// This function is used to manage a click on any arrow button
  void onClickArrowB({bool isLeft}) {
    int incr = 0;

    if (isLeft) {
      if (_index == 0) {
        return;
      }
      incr = -2;
    } else {
      if (_index == activities.length - 1) {
        return;
      }
      incr = 2;
    }

    _index += incr;

    setState(() {

      int count = 0;
      for(int i = _index; (count < 3) && (i < activities.length); i++){
        activitiesToShow[i] = activities[i];
        count++;
      }

      _leftArrowVi =
          _index == 0 ? VisibilityFlag.invisible : VisibilityFlag.visible;

      _rightArrowVi = _index == activities.length - 1
          ? VisibilityFlag.invisible
          : VisibilityFlag.visible;

      _firstSecretOnTap = _index == activities.length - 1
          ? () {
              password.tapSecretCode(id: 1);
            }
          : null;

      _secondSecretOnTap = _index == activities.length - 1
          ? () {
              password.tapSecretCode(id: 2);
            }
          : null;

      password.resetCode();
    });
  }

  ListView _loadCalendar() => ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: activitiesToShow.length,
        itemBuilder: (BuildContext c, int index) =>
            Column(
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: Row(
                    children: <Widget>[
                      ArrowButton(
                          height: 20,
                          visibility: _leftArrowVi,
                          event: () {
                            onClickArrowB(isLeft: true);
                          }),
                      GestureDetector(
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
                                height: (MediaQuery.of(context).size.height /
                                        activitiesToShow.length) - 20,
                                width: (MediaQuery.of(context).size.width /
                                        activitiesToShow.length) - 20,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            activitiesToShow[index]
                                                .getUrlImg()))),
                              ),
                              const SizedBox(height: 10),
                              Text(activitiesToShow[index].getTitle(),
                                  style: TextStyle(
                                      fontSize: 40, color: Colors.black)),
                            ],
                          )),
                      ArrowButton(
                          left: false,
                          height: 20,
                          visibility: _rightArrowVi,
                          event: () {
                            onClickArrowB(isLeft: false);
                          }),
                    ],
                  ),
                ),
              ],
            ));

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[SecretButton(event: _firstSecretOnTap)],
                ),
                Column(
                  children: <Widget>[SecretButton(event: _secondSecretOnTap)],
                )
              ],
            )),
            Flexible(
              child: _activitiesList,
            ),
          ],
        ),
      ));
}
