import 'package:pictron/src/model/dao/game_dao.dart';
import 'package:pictron/src/model/transfers/game_transfer.dart';

class GameLogic {

  // Singelton
  factory GameLogic() => _this ??= GameLogic._();

  GameLogic._();

  static GameLogic _this;

  // For easy access in the application
  static GameLogic get gameL => _this;

  int _gameId = 1;

  set gameId(int value) {
    _gameId = value;
  }

  Future<GameTransfer> loadGame() => GameDao().getGame(_gameId);
}