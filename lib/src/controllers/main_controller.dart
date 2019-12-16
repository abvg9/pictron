import 'package:mvc_pattern/mvc_pattern.dart' show ControllerMVC;
import 'package:pictron/src/model/logic/game_logic.dart';
import 'package:pictron/src/model/logic/story_logic.dart';
import 'package:pictron/src/model/transfers/game_transfer.dart';
import 'package:pictron/src/model/transfers/story_transfer.dart';
import 'package:pictron/src/model/auth/sign_client.dart';
import 'package:pictron/src/model/dao/calendar_dao.dart';
import 'package:pictron/src/model/dao/children_dao.dart';
import 'package:pictron/src/model/dao/sign_in_dao.dart';
import 'package:pictron/src/model/transfers/activity.dart';
import 'package:pictron/src/model/transfers/user.dart';

class Con extends ControllerMVC {
  // Singelton
  factory Con() => _this ??= Con._();

  Con._();

  static Con _this;

  // For easy application access
  static Con get con => _this;

  static final StoryLogic _storyLogic = StoryLogic();
  static final GameLogic _gameLogic = GameLogic();

  static User _user;

  SignClient signInClient;

  final SignInDao _signInDao = SignInDao();
  final ChildrenDao _childrenDao = ChildrenDao();
  final CalendarDao _calendarDao = CalendarDao();

  Future<StoryTransfer> getStory() => _storyLogic.loadStory();

  Future<GameTransfer> getGame() => _gameLogic.loadGame();

  Future<void> signIn(String email, String pass) async {
    try {
      final String id = await _signInDao.login(email, pass);

      _user = User(id, await _childrenDao.getChildren(id),
          await _childrenDao.getGroups(id));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signInAuth(SignClient signClient) async {
    signInClient = signClient;

    try {
      // If user is signed in we sign out.
      if (await signClient.isConnected().then((bool con) => con)) {
        await signClient.handleSignOut();
      }

      await signInClient.handleSignIn();

      //TODO

    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOutAuth() async {
    await signInClient.handleSignOut();
  }

  Future<List<Activity>> loadCalendar(String id) async =>
      _calendarDao.getActivities(id);

  User getUser() => _user;
}
