import 'package:flutter/material.dart';
import 'package:pictron/logic/auth/facebook/facebook_sign_client.dart';
import 'package:pictron/logic/auth/google/google_sign_client.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
      primarySwatch: Colors.blue,
    ),
    home: const MyHomePage(title: 'Log in demos'),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final FacebookSignClient _facebookSignClient = FacebookSignClient();
  final GoogleSignClient _googleSignClient = GoogleSignClient();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: _facebookSignClient.handleSignIn,
            child: const Text('Log In with Facebook'),
          ),
          RaisedButton(
            onPressed: _googleSignClient.handleSignIn,
            child: const Text('Log In with Google'),
          ),
          RaisedButton(
            onPressed: _facebookSignClient.handleSignIn,
            child: const Text('Log Out with Facebook'),
          ),
          RaisedButton(
            onPressed: _googleSignClient.handleSignOut,
            child: const Text('Log Out with Google'),
          ),
        ],
      ),
    ),
  );
}
