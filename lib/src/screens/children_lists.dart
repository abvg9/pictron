import 'package:flutter/material.dart';
import 'package:pictron/src/controllers/main_controller.dart';
import 'package:pictron/src/model/Transfers/children.dart';
import 'package:pictron/src/model/Transfers/children_group.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

class ChildList extends StatefulWidget {
  const ChildList({Key key, this.children, this.childrenGroups})
      : super(key: key);

  @override
  _ChildListState createState() => _ChildListState(children, childrenGroups);

  final List<Children> children;
  final List<ChildrenGroup> childrenGroups;
}

class _ChildListState extends State<ChildList> {
  _ChildListState(List<Children> children, List<ChildrenGroup> childrenGroups) {
    _children = _loadChildren(children);
    _groups = _loadGroups(childrenGroups);
    _selectedList = false;
    _list = _children;
  }

  ListView _children;
  ListView _groups;

  ListView _list;

  bool _selectedList = false;

  ListView _loadChildren(List<Children> children) => ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: children.length,
        itemBuilder: (BuildContext c, int index) => Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CircularProfileAvatar(
                      children[index].getUrlImage(),
                      backgroundColor: Colors.transparent,
                      radius: 40,
                      cacheImage: true,
                      onTap: () {
                        // Open the calendar associated with this child.
                        print(children[index].getName());
                      },
                    )
                  ],
                ),
                Column(
                  children: const <Widget>[
                    SizedBox(width: 10),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      children[index].getName(),
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ],
            )),
      );

  ListView _loadGroups(List<ChildrenGroup> childrenGroups) => ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: childrenGroups.length,
      itemBuilder: (BuildContext c, int index) => Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              // Open the calendar associated with this group.
              print(childrenGroups[index].getGroupName());
            },
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(childrenGroups[index].getGroupName(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))
                  ],
                ),
                Column(
                  children: const <Widget>[
                    SizedBox(height: 10),
                  ],
                ),
                _loadChildren(childrenGroups[index].getChildren())
              ],
            ),
          )));

  @override
  Widget build(BuildContext context) {
    final Widget _buttonsContainer = Container(
      constraints: const BoxConstraints(maxHeight: 120, maxWidth: 500),
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Wrap(
                direction: Axis.horizontal,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 250,
                    height: 60,
                    buttonColor:
                        _selectedList ? Colors.white : Colors.blueAccent,
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _selectedList = false;
                          _list = _children;
                        });
                      },
                      child: const Text('Niños',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 250,
                    height: 60,
                    buttonColor:
                        _selectedList ? Colors.blueAccent : Colors.white,
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _selectedList = true;
                          _list = _groups;
                        });
                      },
                      child: const Text('Grupos',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
    final Widget _groupsContainer = Container(
        constraints: const BoxConstraints(maxHeight: 500, maxWidth: 500),
        padding: const EdgeInsets.all(30),
        color: Colors.white,
        child: _list);
    return Scaffold(
        body: Center(
      child: ListView(
        children: <Widget>[
          const SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buttonsContainer,
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            _groupsContainer,
          ]),
        ],
      ),
    ));
  }
}
