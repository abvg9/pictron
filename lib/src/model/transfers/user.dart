class User {
  User(String id, String email, String name, String surname) {
    _id = id;
    _email = email;
    _name = name;
    _surname = surname;
  }

  User.map(dynamic obj) {
    _id = obj['id_tutor'].toString();
    _email = obj['email'].toString();
    _name = obj['nombre'].toString();
    _surname = obj['apellido'].toString();
  }

  String _id;
  String _email;
  String _name;
  String _surname;

  String getId() => _id;
  String getEmail() => _email;
  String getName() => _name;
  String getSurname() => _surname;
}
