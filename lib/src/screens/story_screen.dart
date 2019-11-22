import 'package:flutter/material.dart';

import 'package:pictron/src/widget/arrow_button.dart';
import 'package:pictron/src/controllers/main_controller.dart';
import 'package:pictron/src/model/transfers/story_transfer.dart';

class StoryScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() =>
      _StoryScreenState(story: Con.con.getStory());
}

class _StoryScreenState extends State<StoryScreen> {

  _StoryScreenState({StoryTransfer story}):
        _st = story,
        _imageUrl = story.pages[story.currentP].imageUrl;

  static const double _arrowHeight = 100;
  final StoryTransfer _st;
  String _imageUrl;

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Pictron',
    home: Scaffold(
      appBar: AppBar(
        title: Text('Cuento: ${_st.title}'),
      ),
      body: Center(child:
        Row(
          children: <Widget>[
            ArrowButton(height: _arrowHeight,
                event: (){onClickArrowB(isLeft: true);}),

            Expanded(flex: 5, child: Image.network(_imageUrl)),

            ArrowButton(left: false, height: _arrowHeight,
                        event: (){onClickArrowB(isLeft: false);}),
          ],
        ),
      ),
    ),
  );

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

    setState(() => _imageUrl = _st.pages[_st.currentP].imageUrl);
  }
}