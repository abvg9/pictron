import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pictron/src/controllers/main_controller.dart';
import 'package:pictron/src/model/tranfers/Task_transfer.dart';

class Calendar extends StatelessWidget {

  @override
  Widget build(BuildContext context) =>
      MaterialApp(
        title: 'PictoTEAsk',
        theme: ThemeData(
          //primarySwatch: Colors.cyan,
          canvasColor: Colors.cyanAccent[100],

        ),
        routes:  <String, WidgetBuilder>{
          "/calendario1" :(BuildContext context) => Calendar1(),
          "/calendario2" :(BuildContext context) => Calendar2(),
          "/cuento" :(BuildContext context) => Cuento(),

        },

        home: Scaffold(

          body: Center(
            child: Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    GestureDetector(
                      // ignore: sort_child_properties_last
                      child:Hero( tag: 'calendario1',
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex:5,

                              child: Container(
                                margin: EdgeInsets.all(100.0),
                                padding: EdgeInsets.all(10.0),
                                alignment: Alignment.topCenter,
                                width: 200,
                                height: 100,
                                decoration: BoxDecoration(
                                  image:   DecorationImage(image:  NetworkImage(

                                      "https://www.pictosonidos.com/img/categorias/1370958012.png")),
                                ),

                                child: Text('COLEGIO', style: TextStyle(fontSize: 40.0, color: Colors.black ),
                                ),

                              ),

                            ),

                          ],
                        ),
                      ),

                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (_) {
                        // return Calendar1();
                        // }));
                        Navigator.push(
                          context,
                          MaterialPageRoute<dynamic>(
                              builder: (BuildContext context) =>
                                  Calendar1()),
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      // ignore: sort_child_properties_last
                      child:Hero( tag: 'calendario2',
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex:5,
                              child:
                              Container(
                                margin: EdgeInsets.all(100.0),
                                padding: EdgeInsets.all(10.0),
                                alignment: Alignment.topCenter,
                                width: 200,
                                height: 100,

                                decoration: BoxDecoration(
                                  image:   DecorationImage(image:  NetworkImage(

                                      "http://www.hospitaldefuenlabrada.org/TEA/img/pictos/cepillar-dientes.jpg")),
                                ),

                                child: Text('DIENTES', style: TextStyle(fontSize: 40.0, color: Colors.black ),
                                ),

                              ),

                            ),

                          ],
                        ),
                      ),

                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (_) {
                        // return Calendar1();
                        // }));
                        Navigator.push(
                          context,
                          MaterialPageRoute<dynamic>(
                              builder: (BuildContext context) =>
                                  Calendar2()),
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      // ignore: sort_child_properties_last
                      child:Hero( tag: 'cuento',
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex:5,
                              child:
                              Container(
                                margin: EdgeInsets.all(100.0),
                                padding: EdgeInsets.all(10.0),
                                alignment: Alignment.topCenter,
                                width: 200,
                                height: 100,

                                decoration: BoxDecoration(

                                  image:   DecorationImage(image:  NetworkImage(

                                      "http://2.bp.blogspot.com/-a2KS5eX6Do0/VD-qqeBnWVI/AAAAAAAAAdA/uXuRTcTdIOE/s1600/cuento.png")),
                                ),

                                child: Text('CUENTO', style: TextStyle(fontSize: 40.0, color: Colors.black ),
                                ),

                              ),

                            ),

                          ],
                        ),
                      ),




                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (_) {
                        // return Calendar1();
                        // }));
                        Navigator.push(
                          context,
                          MaterialPageRoute<dynamic>(
                              builder: (BuildContext context) =>
                                  Cuento()),
                        );
                      },
                    ),
                  ],
                ),


              ],
            ),
          ),

        ),);

}

class Calendar1 extends StatelessWidget {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Expanded(

                    flex:2,
                    child: Container(

                      alignment: Alignment.topLeft,
                      height: 300,

                      decoration: BoxDecoration(

                        image:   DecorationImage(image:  NetworkImage("https://pbs.twimg.com/media/DRodyiAW0AAz68I.jpg:large")),
                      ),
                      child: Text('', style: TextStyle(fontSize: 40.0, color: Colors.black ),
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

                        image:   DecorationImage(image:  NetworkImage("http://educasaac.educa.madrid.org/uploads/image.php?file=201605051512391.png&name=andar_picto_bn&folder=images")),
                      ),
                      child: Text('', style: TextStyle(fontSize: 40.0, color: Colors.black ),
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

                        image:   DecorationImage(image:  NetworkImage(

                            "https://www.pictosonidos.com/img/categorias/1370958012.png")),
                      ),
                      child: Text('', style: TextStyle(fontSize: 40.0, color: Colors.black ),
                      ),
                    ),

                  ),
                ],
              )

          ),
        ),
      );
}
class Calendar2 extends StatelessWidget {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Expanded(

                    flex:2,
                    child: Container(

                      alignment: Alignment.topLeft,
                      height: 300,

                      decoration: BoxDecoration(

                        image:   DecorationImage(image:  NetworkImage("https://pbs.twimg.com/media/DRodyiAW0AAz68I.jpg:large")),
                      ),
                      child: Text('', style: TextStyle(fontSize: 40.0, color: Colors.black ),
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

                        image:   DecorationImage(image:  NetworkImage("http://educasaac.educa.madrid.org/uploads/image.php?file=201605051512391.png&name=andar_picto_bn&folder=images")),
                      ),
                      child: Text('', style: TextStyle(fontSize: 40.0, color: Colors.black ),
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

                        image:   DecorationImage(image:  NetworkImage(

                            "http://www.hospitaldefuenlabrada.org/TEA/img/pictos/cepillar-dientes.jpg")),
                      ),
                      child: Text('', style: TextStyle(fontSize: 40.0, color: Colors.black ),
                      ),
                    ),

                  ),
                ],
              )

          ),
        ),
      );
}
class Cuento extends StatelessWidget {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Expanded(

                    flex:2,
                    child: Container(

                      alignment: Alignment.topLeft,
                      height: 300,

                      decoration: BoxDecoration(

                        image:   DecorationImage(image:  NetworkImage("https://www.pictocuentos.com/images/caperucita.png")),
                      ),
                      child: Text('', style: TextStyle(fontSize: 40.0, color: Colors.black ),
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

                        image:   DecorationImage(image:  NetworkImage("http://www.chinu-cordoba.gov.co/Ciudadanos/PortaldeNinos/Ninas-y-Ninos/PublishingImages/Paginas/Para-aprender/Caperucita-y-el-lobo.png")),
                      ),
                      child: Text('', style: TextStyle(fontSize: 40.0, color: Colors.black ),
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

                        image:   DecorationImage(image:  NetworkImage(

                            "https://image.freepik.com/vector-gratis/ilustracion-pequeno-cuento-hadas-aislado-caperucita-roja_74440-574.jpg")),
                      ),
                      child: Text('', style: TextStyle(fontSize: 40.0, color: Colors.black ),
                      ),
                    ),

                  ),
                ],
              )

          ),
        ),
      );
}

