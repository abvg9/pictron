import 'package:pictron/src/model/transfers/game_transfer.dart';
import 'package:pictron/src/model/transfers/game_page_transfer.dart';

class GameDao {
  Future<GameTransfer> getGame(int id) {
    final List<GamePageTransfer> pages = <GamePageTransfer>[];
    // ignore: cascade_invocations
    pages.add(GamePageTransfer(
        id: 1,
        urlsP: <String>[
          'https://cdn0.iconfinder.com/data/icons/junk-food-emoji-set/100/Taco-512.png',
          'https://www.clipartbay.com/cliparts/free-food-clipart-hdbjteq.jpg',
          'https://clipartstation.com/wp-content/uploads/2018/09/fried-food-clipart.gif'
        ],
        namesP: <String>['taco', 'sandwitch', 'fries'],
        solP: 0));

    // ignore: cascade_invocations
    pages.add(GamePageTransfer(
        id: 2,
        urlsP: <String>[
          'https://cdn4.iconfinder.com/data/icons/sport-icons-set-1/512/a117-512.png',
          'https://www.pinclipart.com/picdir/middle/125-1259604_basketball-cartoon-clip-art-black-and-white-library.png',
          'http://www.luckysports.net/Punt-icon.jpg'
        ],
        namesP: <String>['soccer', 'basketball', 'football'],
        solP: 2));

    return Future<GameTransfer>.value(GameTransfer(id: 1, pagesP: pages));
  }
}
