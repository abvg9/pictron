import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pictron/src/controllers/main_controller.dart';
import 'package:pictron/src/model/tranfers/Task_transfer.dart';


class TaskCalendar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() =>
      _TaskScreenState(task: Con.con.getTask());
}

class _TaskScreenState extends State<TaskCalendar> {

  _TaskScreenState({TaskTransfer task})
      :
        _st = task,
        _imageUrl = task.pag[task.currentP].imageUrl;

  static const double _arrowHeight = 100;
  final TaskTransfer _st;
  String _imageUrl;

  @override
  Widget build(BuildContext context) =>
      MaterialApp(
        title: 'PictoTEAsk',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Tareas por Dia: ${_st.names}'),
          ),
          body: Column(children: <Widget>[
            Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // ignore: prefer_const_literals_to_create_immutables
                Column(children: <Widget>[
                ],),

                Column(children: <Widget>[
                ],)
              ],
            )),

            Expanded(flex: 2, child:
            Row(
              children: <Widget>[
                Expanded(flex: 5, child: Image.network(_imageUrl)),
              ],
            ),
            ),

            Expanded(child: Container())
          ],
          ),
        ),
      );
}
