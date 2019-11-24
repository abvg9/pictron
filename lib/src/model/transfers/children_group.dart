import 'children.dart';

class ChildrenGroup {
  ChildrenGroup(String groupName, List<Children> childrenList) {
    _groupName = groupName;
    _childrenList = childrenList;
  }

  String _groupName;
  List<Children> _childrenList;

  String getGroupName() => _groupName;
  List<Children> getChildren() => _childrenList;
}
