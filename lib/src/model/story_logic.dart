import 'package:pictron/src/model/transfers/story_transfer.dart';
import 'package:pictron/src/model/transfers/story_page_transfer.dart';

class StoryLogic {

  // Singelton
  factory StoryLogic() => _this ??= StoryLogic._();

  StoryLogic._();

  static StoryLogic _this;

  // For easy access in the application
  static StoryLogic get storyL => _this;

  /// This function is used as enter point to load a story
  /// TODO load from DAO the story transfer
  StoryTransfer loadStory(int id) =>
      StoryTransfer(id: id, name: 'Prueba',
        list: <StoryPageTransfer>[
          StoryPageTransfer(id: 0, url: 'https://picsum.photos/250?image=9'),
          StoryPageTransfer(id: 1,
              url: 'https://upload.wikimedia.org/wikipedia/'
                  'commons/6/69/IBM_PC_5150.jpg')]
        );
}