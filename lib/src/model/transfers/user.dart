import 'children.dart';
import 'children_group.dart';

class User {
  User(String id, List<Children> children, List<ChildrenGroup> childrenGroups) {
    _id = id;
    _children = children;
    _childrenGroups = childrenGroups;
  }

  User.map(dynamic obj) {
    _id = obj['id_tutor'].toString();
  }

  String _id;
  List<Children> _children;
  List<ChildrenGroup> _childrenGroups;

  String getId() => _id;
  List<Children> getChildren() => _children;
  List<ChildrenGroup> getChildrenGroups() => _childrenGroups;
}
