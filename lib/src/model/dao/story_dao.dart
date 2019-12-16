import 'dart:async';
import 'dart:convert' as convert;
import 'package:pictron/src/model/dao/dao.dart';
import 'package:pictron/src/model/transfers/story_transfer.dart';
import 'package:pictron/src/model/transfers/story_page_transfer.dart';

class StoryDao extends Dao {

  StoryDao() {
    _url = '$urlAPI/getPagesStory.php';
  }
  String _url;

  Future<StoryTransfer> getStory(int id) async {
    final List<StoryPageTransfer> pages = <StoryPageTransfer>[];
    final List<int> pIds = await _getStoryPost(id);

    for (final int id in pIds) {
      pages.add(await _getPagePost(id));
    }

    return Future<StoryTransfer>.value(
        StoryTransfer(id: id, name: '', list: pages));
  }

  Future<List<int>> _getStoryPost(int storyId) async {
    final dynamic res = await post(_url,
        body: <String, String>{'id_cuento': storyId.toString()});

    if (res['error'].toString() == 'true') {
      Exception(res['error_msg'].toString());
    }
    final List<String> pages = res['pages']
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '')
        .split(', ');
    final List<int> ids = <int>[];
    for (final String page in pages) {
      ids.add(int.parse(page));
    }

    return ids;
  }

  Future<StoryPageTransfer> _getPagePost(int pageId) async {
    
    final dynamic res = await post(_url,
        body: <String, String>{'id_pagina': pageId.toString()});
    if (res['error'].toString() == 'true') {
      Exception(res['error_msg'].toString());
    }

    final String path = res['page']['path'].toString();
    return StoryPageTransfer(id: pageId, url: urlAPI + path);
  }
}
