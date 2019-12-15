import 'package:flutter/material.dart';
import 'package:pictron/src/model/transfers/activity.dart';
import 'package:pictron/src/controllers/main_controller.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key key, this.activities}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();

  final List<Activity> activities;
}

class _CalendarState extends State<Calendar> {
  _CalendarState({this.activities, this.controller});

  Con controller;
  List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    final Widget container = Container(
      constraints: const BoxConstraints(maxHeight: 540, maxWidth: 540),
      padding: const EdgeInsets.only(right: 40, left: 40),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: ListView(
        children: <Widget>[
          const Text('Inicio de sesión',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'KaushanScript',
                fontSize: 60,
              )),
          const SizedBox(height: 30),
          Container(
            child: Row(children: const <Widget>[
              Text(
                'Email',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          const SizedBox(height: 10),
          Container(
            child: Row(
              children: const <Widget>[
                Text(
                  'Contraseña',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 100, right: 10),
                  child: Divider(
                    color: Colors.black,
                    height: 10,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text('o'),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 100),
                  child: Divider(
                    color: Colors.black,
                    height: 10,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
    return Scaffold(
      body: Center(child: container),
    );
  }
}
