import 'children.dart';
import 'children_group.dart';

class User {
  User(String id, List<Child> children, List<ChildrenGroup> childrenGroups) {
    _id = id;
    _children = children;
    _childrenGroups = childrenGroups;
  }

  String _id;
  List<Child> _children;
  List<ChildrenGroup> _childrenGroups;

  String getId() => _id;
  List<Child> getChildren() => _children;
  List<ChildrenGroup> getChildrenGroups() => _childrenGroups;
}
