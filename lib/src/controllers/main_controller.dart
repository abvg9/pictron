import 'package:mvc_pattern/mvc_pattern.dart' show ControllerMVC;

import 'package:pictron/src/model/story_logic.dart';
import 'package:pictron/src/model/transfers/story_transfer.dart';

//import 'package:pictron/src/app.dart' show App;

class Con extends ControllerMVC {

  // Singelton
  factory Con() => _this ??= Con._();

  Con._();

  static Con _this;

  // For easy access in the application
  static Con get con => _this;

  static final StoryLogic _storyLogic = StoryLogic();

   StoryTransfer getStory() => _storyLogic.loadStory(0);
}
