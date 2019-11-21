import 'package:flutter/material.dart';
import 'package:pictron/src/widget/arrow_button.dart';

class StoryScreen extends StatefulWidget {

  StoryScreen({String title, String url}):
        storyTitle = title,
        imageUrl = url;

  final String storyTitle;
  String imageUrl;

  @override
  State<StatefulWidget> createState() =>
                        _StoryScreenState(title: storyTitle, url: imageUrl);
}

class _StoryScreenState extends State<StoryScreen> {

  _StoryScreenState({String title, String url}):
        storyTitle = title,
        imageUrl = url;

  final String storyTitle;
  String imageUrl;

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Pictron',
    home: Scaffold(
      appBar: AppBar(
        title: Text('Cuento: $storyTitle'),
      ),
      body: Center(child:
      Row(
        children: <Widget>[
          const ArrowButton(left: true),
          Image.network(imageUrl),
          const ArrowButton(left: false),
        ],
      ),
      ),
    ),
  );
}