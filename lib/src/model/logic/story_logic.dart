import 'package:pictron/src/model/transfers/story_transfer.dart';
import 'package:pictron/src/model/dao/story_dao.dart';

class StoryLogic {
  // Singelton
  factory StoryLogic() => _this ??= StoryLogic._();

  StoryLogic._();

  static StoryLogic _this;

  // For easy access in the application
  static StoryLogic get storyL => _this;

  int _storyId = 3;

  void setStoryId(int value) {
    _storyId = value;
  }

  Future<StoryTransfer> loadStory() => StoryDao().getStory(_storyId);
}
