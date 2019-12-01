class AuthError implements Exception {

  AuthError(String service) {
    _service = service;
  }

  String _service;

  @override
  String toString() => '$_service no responde, vuelve a inentarlo más tarde.';
}

class InvalidCredentials implements Exception {

  InvalidCredentials(String service) {
    _service = service;
  }

  String _service;

  @override
  String toString() => 'Usuario o contraseña de $_service incorrectos.';
}

abstract class SignClient {

  String _apiToken;

  Future<void> handleSignIn();
  Future<void> handleSignOut();

  Future<String> getToken();
  Future<bool> isConnected();

  void setAPIToken(String token){
    _apiToken = token;
  }

  String getAPIToken() => _apiToken;
  
}
