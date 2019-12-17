import 'package:flutter_test/flutter_test.dart';
import 'package:pictron/src/model/transfers/children.dart';
import 'package:pictron/src/model/transfers/children_group.dart';
import 'package:pictron/src/controllers/main_controller.dart';

Future<void> main() async {
  final Con controller = Con();

  const String user = 'mail@mail.com';
  const String pass = 'Patata01';

  await controller.signIn(user, pass);

  group('Children in dao tests', () {
    returnCorrectChildren(controller.getUser().getChildren());
    returnCorrectChildrenGroups(controller.getUser().getChildrenGroups());
  });
}

void returnCorrectChildren(List<Child> children) {
  test('Check if the list of children is correct.', () {
    final List<Child> childrenCheck = <Child>[
      Child(id: '7', nick: 'Erick'),
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
          id: '13',
          groupName: 'Grupo 1',
          childrenList: <Child>[Child(id: '7', nick: 'Erick')]),
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
