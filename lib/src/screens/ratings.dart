import 'package:flutter/material.dart';

class Ratings extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.cyanAccent,
        //primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent
        child: Container(
          constraints: BoxConstraints(maxHeight: 540, maxWidth: 540),
          padding: EdgeInsets.only(right: 40, left: 40),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: ListView(
            children: <Widget>[
              const Text('Valoración de actividad',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'KaushanScript',
                  fontSize: 60,
                ),
              ),
              const SizedBox(height: 30),


              Row(
                children: <Widget>[
                  Expanded(
                    //constraints: BoxConstraints(maxHeight: 540, maxWidth: 540),

                    child: TextField(
                      maxLines: 8,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Escribe aqui'
                      ),
                    ),
                  ),
                ],
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.star, size: 48.0, color: Colors.grey),
                  Icon(Icons.star, size: 48.0, color: Colors.grey),
                  Icon(Icons.star, size: 48.0, color: Colors.grey),
                  Icon(Icons.star, size: 48.0, color: Colors.grey),
                  Icon(Icons.star, size: 48.0, color: Colors.grey),
                ],
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    height: 35,
                    minWidth: 225,
                    color: Colors.blueAccent,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.white)),
                    child: const Text('GUARDAR',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
