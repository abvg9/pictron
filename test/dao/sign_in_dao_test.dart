import 'package:flutter_test/flutter_test.dart';
import 'package:pictron/src/model/dao/sign_in_dao.dart';

void main() {
  group('Sign in dao tests', () {
    isAValidPetition();
    isAInvalidPetition();
  });
}

void isAValidPetition() {
  test(
      'Sign in dao must detects that '
      'the credentials are correct.', () {
    final SignInDao signInDao = SignInDao();

    const String invalidEmail = 'fakeEmail@hotmail.com';
    const String validEmail = 'mail@mail.com';

    const String invalidPassword = 'ICWIENER';
    const String validPassword = 'Patata01';

    signInDao.login(validEmail, validPassword).then((String ret) {
      expect(ret, '7');
    });

    expect(
        () => signInDao.login(invalidEmail, invalidPassword), throwsException);
  });
}

void isAInvalidPetition() {
  test(
      'Sign in dao must detects that '
      'user did not fill credentials', () {
    final SignInDao signInDao = SignInDao();

    expect(() => signInDao.login('', ''), throwsException);
  });
}
