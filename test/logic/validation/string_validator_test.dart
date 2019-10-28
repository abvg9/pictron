import 'package:flutter_test/flutter_test.dart';
import 'package:pictron/logic/validation/string_validator.dart';

void main() {
  group('String validator tests', () {
    isEmailCorrect();
    isEmailIncorrect();
  });
}

void isEmailCorrect() {

  test('String validator must detects that the emails are in a correct format', () {

    final StringValidator stringValidator = new StringValidator();

    final fakeEmail = "fakeEmail@hotmail.com";

    expect(stringValidator.isEmail(fakeEmail), true);

  });

}

void isEmailIncorrect() {

  test('String validator must detects that the emails are not in a correct format', () {

    final StringValidator stringValidator = new StringValidator();

    final fakeEmail1 = "fakeEmail-gmail.com";
    final fakeEmail2 = "fakeEmail@hotmailcom";
    final fakeEmail3 = "fakeEmailgmail.com";

    expect(stringValidator.isEmail(fakeEmail1), false);
    expect(stringValidator.isEmail(fakeEmail2), false);
    expect(stringValidator.isEmail(fakeEmail3), false);

  });
}