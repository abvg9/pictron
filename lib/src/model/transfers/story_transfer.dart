import 'package:pictron/src/model/transfers/story_page_transfer.dart';

class StoryTransfer {
  StoryTransfer({int id, String name, List<StoryPageTransfer> list})
      : storyId = id,
        title = name,
        pages = list;

  int storyId;
  String title;
  List<StoryPageTransfer> pages;
  int currentP = 0;
}
