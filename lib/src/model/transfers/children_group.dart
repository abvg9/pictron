import 'children.dart';

class ChildrenGroup {
  ChildrenGroup({this.groupName, this.childrenList, this.id});

  ChildrenGroup.fromJson(dynamic json) {
    id = json['id_group'].toString();
    groupName = json['nombre'].toString();
  }

  String groupName;
  String id;
  List<Child> childrenList;

  String getId() => id;
  String getGroupName() => groupName;
  List<Child> getChildren() => childrenList;
}
