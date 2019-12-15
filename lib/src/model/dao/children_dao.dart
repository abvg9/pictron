import 'package:pictron/src/model/dao/dao.dart';
import 'package:pictron/src/model/transfers/children.dart';
import 'package:pictron/src/model/transfers/children_group.dart';

class ChildrenDao extends Dao {
  ChildrenDao() {
    _urlChildren = '$urlAPI/getNinosTutor.php';
    _urlGroups = '$urlAPI/getNinosGrupo.php';
    _urlIdGroups = '$urlAPI/getGrupoTutor.php';
  }

  String _urlChildren;
  String _urlGroups;
  String _urlIdGroups;

  Future<List<Child>> getChildren(String id) =>
      post(_urlChildren, body: <String, String>{'Tutor': id})
          .then((dynamic response) async {
        if (response == null) {
          throw EmptyResponse();
        }

        final List<dynamic> childrenList = response['kids'] as List<dynamic>;

        return childrenList
            .map<Child>((dynamic json) => Child.fromJson(json))
            .toList();
      }).catchError((Object e) => throw e);

  Future<List<ChildrenGroup>> _getIdGroups(String id) =>
      post(_urlIdGroups, body: <String, String>{'Tutor': id})
          .then((dynamic response) async {
        if (response == null) {
          throw EmptyResponse();
        }

        final List<dynamic> childrenList = response['Grupos'] as List<dynamic>;

        return childrenList
            .map<ChildrenGroup>((dynamic json) => ChildrenGroup.fromJson(json))
            .toList();
      }).catchError((Object e) => throw e);

  Future<List<ChildrenGroup>> getGroups(String id) async {
    final List<ChildrenGroup> idGroups =
        await _getIdGroups(id).catchError((Object e) => throw e);

    for (int i = 0; i < idGroups.length; i++) {
      idGroups[i].childrenList = await post(_urlGroups, body: <String, String>{
        'Nombre_grupo': idGroups[i].getGroupName(),
        'Tutor': id
      }).then((dynamic response) async {

        if (response == null) {
          throw EmptyResponse();
        }

        final List<dynamic> childrenList = response['kids'] as List<dynamic>;

        return childrenList
            .map<Child>((dynamic json) => Child.fromJson(json))
            .toList();
      }).catchError((Object e) => throw e);
    }

    return idGroups;
  }
}
