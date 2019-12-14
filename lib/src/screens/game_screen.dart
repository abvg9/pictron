import 'package:flutter/material.dart';
import 'package:pictron/src/controllers/main_controller.dart';
import 'package:pictron/src/model/transfers/game_page_transfer.dart';
import 'package:pictron/src/model/transfers/game_transfer.dart';
import 'package:pictron/src/widget/loading_screen.dart';
import 'package:pictron/src/widget/secret_button.dart';
import 'package:pictron/src/widget/visibility.dart';

class GameScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  static const Color backColor = Color(0xffbcfaff);
  GameTransfer _game;
  GamePageTransfer _currentPage;
  GestureTapCallback _firstSecretOnTap;
  GestureTapCallback _secondSecretOnTap;
  int _firstCodeTaps = 0;
  int _secondCodeTaps = 0;

  @override
  void initState() {
    super.initState();
    Con.con.getGame().then((GameTransfer game){
      setState(() {
        _game = game;
        _currentPage = _game.pages[_game.currentP];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget app;

    if(app != null){
      app = MaterialApp(
        title: 'Pictron',
        home: Scaffold(
          backgroundColor: backColor,
          body: Row(
            children: <Widget>[
              Expanded(flex: 2, child: Container(
                child: Column(children: <Widget>[
                  Expanded(flex: 1, child:
                    SecretButton(event: _firstSecretOnTap)),
                  Expanded(flex: 3, child:
                    Text(_currentPage.names[_currentPage.sol])),
                  Expanded(flex: 1, child:
                    SecretButton(event: _secondSecretOnTap)),
                ])
              )),
              Expanded(flex: 3, child: Container()),
              Expanded(flex: 2, child: Container()),
            ],
          )
        ),
      );
    }
    else{
      app = LoadingScreen();
    }

    return app;
  }

}