import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pictron/src/widget/arrow_button.dart';
import 'package:pictron/src/controllers/main_controller.dart';
import 'package:pictron/src/model/transfers/story_transfer.dart';
import 'package:pictron/src/widget/visibility.dart';
import 'package:pictron/src/widget/secret_button.dart';
import 'package:pictron/src/widget/loading_screen.dart';

class StoryScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {

  static const Color backColor = Color(0xffbcfaff);
  static const double _arrowHeight = 100;
  StoryTransfer _st;
  String _imageUrl;
  VisibilityFlag _leftArrowVi = VisibilityFlag.invisible;
  VisibilityFlag _rightArrowVi = VisibilityFlag.visible;
  GestureTapCallback _firstSecretOnTap;
  GestureTapCallback _secondSecretOnTap;
  int _firstCodeTaps = 0;
  int _secondCodeTaps = 0;

  @override
  void initState() {
    super.initState();
    Con.con.getStory().then((StoryTransfer story){
      print('\n\nkkkkk\n\n');
      setState(() {
        _st = story;
        _imageUrl = _st.pages[_st.currentP].imageUrl;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget app;

    if(_st != null) {
        app = MaterialApp(
          title: 'Pictron',
          home: Scaffold(
            body: Column(children: <Widget>[
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(children: <Widget>[
                    SecretButton(event: _firstSecretOnTap)
                  ],),

                  Column(children: <Widget>[
                    SecretButton(event: _secondSecretOnTap)
                  ],)
                ],
              )),

              Expanded(flex: 2, child:
              Row(
                children: <Widget>[
                  ArrowButton(height: _arrowHeight, visibility: _leftArrowVi,
                      event: () {
                        onClickArrowB(isLeft: true);
                      }),

                  Expanded(flex: 5, child: Image.network(_imageUrl)),

                  ArrowButton(left: false, height: _arrowHeight,
                      visibility: _rightArrowVi,
                      event: () {
                        onClickArrowB(isLeft: false);
                      }),
                ],
              ),
              ),

              Expanded(child: Container())
            ],
            ),
            backgroundColor: backColor,
          ),
        );
      }
      else {
        // initialize waiting screen
        app = LoadingScreen();
      }
      return app;
    }
    /// This function is used to manage a click on any arrow button
    void onClickArrowB({bool isLeft}){
      int incr = 0;

      if(isLeft){
        if(_st.currentP == 0){
          return;
        }
        incr = -1;
      }
      else {
        if(_st.currentP == _st.pages.length-1){
          return;
        }
        incr = 1;
      }

      _st.currentP += incr;

      setState(() {
        _imageUrl = _st.pages[_st.currentP].imageUrl;

        _leftArrowVi = _st.currentP == 0 ?
        VisibilityFlag.invisible : VisibilityFlag.visible;

        _rightArrowVi = _st.currentP == _st.pages.length-1 ?
        VisibilityFlag.invisible : VisibilityFlag.visible;

        _firstSecretOnTap = _st.currentP == _st.pages.length-1 ?
            (){tapSecretCode(id: 1);} : null;

        _secondSecretOnTap = _st.currentP == _st.pages.length-1 ?
            (){tapSecretCode(id: 2);} : null;

        _firstCodeTaps = 0;
        _secondCodeTaps = 0;
      });
    }

    /// It's used to finish the story.
    /// Secret code:
    ///     1: 2 taps on the first(top/left) secret button
    ///     2: 1 taps on the second(top/right) secret button
    void tapSecretCode({int id}) {
      if (id == 1){
        if(_firstCodeTaps < 2){
          _firstCodeTaps++;
        }
        else {
          _firstCodeTaps = 0;
          _secondCodeTaps = 0;
        }
      }
      else if(id == 2){
        if(_firstCodeTaps != 2){
          _secondCodeTaps = 0;
          _firstCodeTaps = 0;
        }
        else {
          _secondCodeTaps++;
        }
      }

      /// Code accepted
      if(_firstCodeTaps == 2 && _secondCodeTaps == 1){
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      }
    }
  }