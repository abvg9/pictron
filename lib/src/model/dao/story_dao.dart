import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart';

import 'package:pictron/src/model/transfers/story_transfer.dart';
import 'package:pictron/src/model/transfers/story_page_transfer.dart';

class StoryDao {

  static const String _rootUrl = 'https://pictoteask.000webhostapp.com';
  static const String _url = '$_rootUrl/getPagesStory.php';

  Future<StoryTransfer> getStory(int id) async {
    List<StoryPageTransfer> pages;
    List<int> pIds;
    await _getStoryPost(id).then((List<int> ids){
      pIds = ids;
      for(final int id in pIds){
        _getPagePost(id).then((StoryPageTransfer p){pages.add(p);});
      }
    });

    return Future<StoryTransfer>
        .value(StoryTransfer(id: id, name: '', list: pages));
  }

  Future<List<int>> _getStoryPost(int storyId) async {
    final Response response = await post(_url,
        body: <String, String>{'id_cuento': storyId.toString()});

    final dynamic res = convert.jsonDecode(response.body);
    if (res['error'].toString() == 'true'){
            Exception(res['error_msg'].toString());
    }
    final List<String> pages = res['pages'].toString()
        .replaceAll(RegExp('[]'), '')
        .split(', ');

    List<int> ids;
    for (final String page in pages){
      print(page);
      ids.add(int.parse(page));
    }
    return ids;
  }

  Future<StoryPageTransfer> _getPagePost(int pageId) async {
    final Response response = await post(_url,
        body: <String, String>{'id_pagina': pageId.toString()});

    final dynamic res = convert.jsonDecode(response.body);
    if (res['error'].toString() == 'true'){
      Exception(res['error_msg'].toString());
    }

    final String path = res['path'].toString();
    return StoryPageTransfer(id: pageId, url: _rootUrl + path);
  }
}
