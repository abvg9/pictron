class GamePageTransfer {
  GamePageTransfer({int id, List<String> urlsP, List<String> namesP, int solP})
      : pageId = id,
        urls = urlsP,
        names = namesP,
        sol = solP;

  int pageId;
  List<String> urls;
  List<String> names;
  int sol;
}
