import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pictron/src/controllers/main_controller.dart';
import 'package:pictron/src/model/transfers/game_page_transfer.dart';
import 'package:pictron/src/model/transfers/game_transfer.dart';
import 'package:pictron/src/widget/loading_screen.dart';
import 'package:pictron/src/widget/secret_button.dart';

class GameScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  static const Color backColor = Color(0xffbcfaff);
  static const String checkPath = 'assets/check.png';
  GameTransfer _game;
  GamePageTransfer _currentPage;
  GestureTapCallback _firstSecretOnTap;
  GestureTapCallback _secondSecretOnTap;
  final PasswordTwoButtons _password = PasswordTwoButtons();
  List<String> _feedbackPath = <String>['', '', ''];

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

    if(_game != null){
      app = MaterialApp(
        title: 'Pictron',
        home: Scaffold(
          backgroundColor: backColor,
          body: Column(
            children: <Widget>[
              Expanded(flex: 2, child: Container(
                child: Row(children: <Widget>[
                  Column(children:
                    <Widget>[SecretButton(event: _firstSecretOnTap)],),
                  Expanded(flex: 3, child:
                    Text(_currentPage.names[_currentPage.sol],
                        textAlign: TextAlign.center,
                        textScaleFactor: 5,
                        style: const TextStyle(fontWeight: FontWeight.bold)
                    )),
                  Column(children:
                    <Widget>[SecretButton(event: _secondSecretOnTap)])
                ])
              )),
              Expanded(flex: 3, child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(onTap: (){_onClickImage(pos: 0);},
                          child: Image.network(_currentPage.urls[0])
                  ),
                  InkWell(onTap: (){_onClickImage(pos: 1);},
                      child: Image.network(_currentPage.urls[1])
                  ),
                  InkWell(onTap: (){_onClickImage(pos: 2);},
                      child: Image.network(_currentPage.urls[2])
                  )
                ]
              )),
              Expanded(flex: 2, child: Row(
                children: <Widget>[
                  Expanded(child: Ink.image(image:
                    AssetImage(_feedbackPath[0]))),
                  Expanded(child: Ink.image(image:
                    AssetImage(_feedbackPath[1]))),
                  Expanded(child: Ink.image(image:
                    AssetImage(_feedbackPath[2])))
                ]
              )),
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


  /// Used to manage a click on a image
  void _onClickImage({int pos}){
    if(pos >= _currentPage.names.length || pos != _currentPage.sol){
      return;
    }

    setState(() {
      _feedbackPath = <String>['', '', ''];
      _feedbackPath[_currentPage.sol] = checkPath;

      if(_game.currentP < _game.pages.length-1) {
        Timer(Duration(seconds: 2), () {
          setState(() {
            _feedbackPath = <String>['', '', ''];
            _game.currentP++;
            _currentPage = _game.pages[_game.currentP];
            _password.resetCode();
          });
        });
      }
      else if (_game.currentP == _game.pages.length - 1) {
          _firstSecretOnTap = () {
            _password.tapSecretCode(id: 1);
          };
          _secondSecretOnTap = () {
            _password.tapSecretCode(id: 2);
          };
          _password.resetCode();
        }
    });

  }

}