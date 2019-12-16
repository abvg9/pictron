import 'package:pictron/src/model/transfers/game_page_transfer.dart';

class GameTransfer {
  GameTransfer({int id, List<GamePageTransfer> pagesP}):
        gameId = id,
        pages = pagesP;

  int gameId;
  List<GamePageTransfer> pages;
  int currentP = 0;
}