import 'package:flutter_test/flutter_test.dart';
import 'package:pictron/src/model/transfers/children.dart';
import 'package:pictron/src/model/transfers/children_group.dart';
import 'package:pictron/src/controllers/main_controller.dart';

Future<void> main() async {
  final Con controller = Con();

  const String user = 'aa@gmail.com';
  const String pass = 'Alberto123';

  await controller.signIn(user, pass);

  group('Children in dao tests', () {
    returnCorrectChildren(controller.getUser().getChildren());
    returnCorrectChildrenGroups(controller.getUser().getChildrenGroups());
  });
}

void returnCorrectChildren(List<Child> children) {
  test('Check if the list of children is correct.', () {
    final List<Child> childrenCheck = <Child>[
      Child(id: '6', nick: 'Pepito'),
      Child(id: '7', nick: 'Pepito grillo'),
      Child(id: '8', nick: 'asdasdasda'),
      Child(id: '9', nick: 'saddas'),
      Child(id: '10', nick: 'asd'),
      Child(id: '11', nick: 'aas'),
      Child(id: '12', nick: 'Pepito12'),
      Child(id: '14', nick: 'Niño2'),
      Child(id: '15', nick: 'Jorgito'),
      Child(id: '16', nick: 'harry'),
      Child(id: '17', nick: 'asdf'),
      Child(id: '18', nick: 'adsf'),
      Child(id: '19', nick: 'dsa'),
      Child(id: '20', nick: 'fasd'),
      Child(id: '21', nick: 'ads'),
      Child(id: '22', nick: 'dda'),
      Child(id: '23', nick: 'Harrya'),
      Child(id: '24', nick: 'adfadsf'),
      Child(id: '25', nick: 'adsfasd'),
      Child(id: '26', nick: 'adfas'),
      Child(id: '27', nick: 'asefds'),
      Child(id: '28', nick: 'Ron'),
      Child(id: '29', nick: 'Rodrigo'),
      Child(id: '30', nick: 'Juan'),
      Child(id: '31', nick: 'Arturito'),
      Child(id: '32', nick: 'nick')
    ];

    expect(childrenCheck.length, children.length);

    for (int i = 0; i < children.length; i++) {
      expect(childrenCheck[i].getId(), children[i].getId());
      expect(childrenCheck[i].getNick(), children[i].getNick());
    }
  });
}

void returnCorrectChildrenGroups(List<ChildrenGroup> groups) {
  test('Check if the list of children groups is correct.', () {
    final List<ChildrenGroup> childrenGroupsCheck = <ChildrenGroup>[
      ChildrenGroup(
          id: '122',
          groupName: 'Clase 2',
          childrenList: <Child>[Child(id: '22', nick: 'dda')]),
      ChildrenGroup(
          id: '127',
          groupName: 'Clase 4qwe',
          childrenList: <Child>[Child(id: '18', nick: 'adsf')]),
      ChildrenGroup(
          id: '128',
          groupName: 'Clase 4asd',
          childrenList: <Child>[Child(id: '25', nick: 'adsfasd')]),
      ChildrenGroup(id: '129', groupName: 'asdada', childrenList: <Child>[
        Child(id: '7', nick: 'Pepito grillo'),
        Child(id: '14', nick: 'Niño2')
      ]),
      ChildrenGroup(
          id: '130',
          groupName: 'sdadsa',
          childrenList: <Child>[Child(id: '8', nick: 'asdasdasda')]),
    ];

    expect(childrenGroupsCheck.length, groups.length);

    for (int i = 0; i < groups.length; i++) {
      expect(childrenGroupsCheck[i].getId(), groups[i].getId());
      expect(childrenGroupsCheck[i].getGroupName(), groups[i].getGroupName());

      expect(childrenGroupsCheck[i].getChildren().length,
          groups[i].getChildren().length);

      for (int j = 0; j < groups[i].getChildren().length; j++) {
        expect(groups[i].getChildren()[j].getId(),
            childrenGroupsCheck[i].getChildren()[j].getId());

        expect(groups[i].getChildren()[j].getNick(),
            childrenGroupsCheck[i].getChildren()[j].getNick());
      }
    }
  });
}
