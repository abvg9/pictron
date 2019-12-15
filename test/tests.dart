import 'package:flutter_test/flutter_test.dart';
import 'package:pictron/src/controllers/main_controller.dart';
import 'dao/children_dao.dart';
import 'dao/sign_in_dao.dart';
import 'model/validation/string_validator_test.dart';

Future<void> main() async {
  group('String validator tests', () {
    isEmailCorrect();
    isEmailIncorrect();
  });

  group('Sign in dao tests', () {
    isAValidPetition();
    isAInvalidPetition();
  });

  final Con controller = Con();

  const String user = 'aa@gmail.com';
  const String pass = 'Alberto123';

  await controller.signIn(user, pass);

  group('Children in dao tests', () {
    returnCorrectChildren(controller.getUser().getChildren());
    returnCorrectChildrenGroups(controller.getUser().getChildrenGroups());
  });
}
