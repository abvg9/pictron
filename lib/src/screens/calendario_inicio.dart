import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pictron/src/controllers/main_controller.dart';
import 'package:pictron/src/model/tranfers/Task_transfer.dart';


class TaskCalendar2 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() =>
      _TaskScreenState(task: Con.con.getTask());
}

class _TaskScreenState extends State<TaskCalendar2> {

  _TaskScreenState({TaskTransfer task}):
        _st = task,
        _imageUrl = task.pag[task.currentP].imageUrl;

  static const double _arrowHeight = 100;
  final TaskTransfer _st;
  String _imageUrl;

  @override
  Widget build(BuildContext context) =>
      MaterialApp(
        title: 'PictoTEAsk',
        theme: ThemeData(
          //primarySwatch: Colors.cyan,
          canvasColor: Colors.cyanAccent[100],
        ),
        home: Scaffold(

          body: Center(
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Expanded(

                    flex:2,
                    child:
                    Container(
                      alignment: Alignment.topLeft,
                      height: 300,

                      decoration: BoxDecoration(

                        image:  new DecorationImage(image:  NetworkImage(

                            "http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzI4NjY3LnBuZw==")),
                      ),
                      child: Text('DESAYUNAR', style: TextStyle(fontSize: 40.0, color: Colors.black ),
                      ),



                    ),


                  ),

                  Expanded(

                    flex:2,
                    child:
                    Container(
                      alignment: Alignment.topLeft,
                      height: 300,

                      decoration: BoxDecoration(

                        image:  new DecorationImage(image:  NetworkImage(

                            "http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzMwODIucG5n")),
                      ),
                      child: Text('COLEGIO', style: TextStyle(fontSize: 40.0, color: Colors.black ),
                      ),



                    ),


                  ),
                  Expanded(

                    flex:2,
                    child:
                    Container(
                      alignment: Alignment.topLeft,
                      height: 300,

                      decoration: BoxDecoration(

                        image:  new DecorationImage(image:  NetworkImage(

                            "http://www.arasaac.org/classes/img/thumbnail.php?i=c2l6ZT0zMDAmcnV0YT0uLi8uLi9yZXBvc2l0b3Jpby9vcmlnaW5hbGVzLzgzNDYucG5n")),
                      ),
                      child: Text('CUENTO', style: TextStyle(fontSize: 40.0, color: Colors.black ),
                      ),



                    ),


                  ),
                ],
              )

          ),
        ),
      );
}
