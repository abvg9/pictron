const String format =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[['
    r'0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+'
    r'[a-zA-Z]{2,}))$';

class StringValidator {
  static final RegExp _emailRegExp = RegExp(format);

  bool isEmail(String email) => _emailRegExp.hasMatch(email);
}
