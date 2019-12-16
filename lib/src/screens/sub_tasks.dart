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

    int increment = 0;

    if (isLeft) {
      if (_index <= 0) {
        return;
      }
      increment = -3;
    } else {
      if (_index >= activities.length - 1) {
        return;
      }
      increment = 3;
    }

    _index += increment;

    setState(() {

      int count = 0;
      activitiesToShow.clear();
      for(int i = _index; (count < 3) && (i < activities.length); i++){
        activitiesToShow.add(activities[i]);
        count++;
      }

      _leftArrowVi =
          _index == 0 ? VisibilityFlag.invisible : VisibilityFlag.visible;

      _rightArrowVi = _index+3 >= activities.length - 1
          ? VisibilityFlag.invisible
          : VisibilityFlag.visible;

      _firstSecretOnTap = _index+3 >= activities.length - 1
          ? () {
              password.tapSecretCode(id: 1);
            }
          : null;

      _secondSecretOnTap = _index+3 >= activities.length - 1
          ? () {
              password.tapSecretCode(id: 2);
            }
          : null;

      password.resetCode();
      _activitiesList = _loadCalendar();
    });
  }

  ListView _loadCalendar() => ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: activitiesToShow.length,
      itemBuilder: (BuildContext c, int index) =>
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                flex: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          // Show image.
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: (MediaQuery.of(context).size.height /
                                        activitiesToShow.length) - 50,
                              width: (MediaQuery.of(context).size.width /
                                        activitiesToShow.length) - 50,
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
                    ],
                  ),
                ),
              ],
            ));

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            /*
            Row(
              children: <Widget>[
                Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SecretButton(event: _firstSecretOnTap)
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SecretButton(event: _secondSecretOnTap)
                          ],
                        )
                      ],
                    )
                ),
              ],
            ),
             */
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ArrowButton(
                    visibility: _leftArrowVi,
                    event: () {
                      onClickArrowB(isLeft: true);
                    }),
              ],
            ),
            Flexible(
              child: _activitiesList,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ArrowButton(
                    left: false,
                    visibility: _rightArrowVi,
                    event: () {
                      onClickArrowB(isLeft: false);
                    }),
              ],
            ),
          ],
        ),
      ));
}
