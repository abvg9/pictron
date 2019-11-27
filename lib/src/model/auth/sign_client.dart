abstract class SignClient {
  String token;
  bool connected;

  Future<void> handleSignIn();
  Future<void> handleSignOut();

  String getToken() {
    print(token);
    return token;
  }

  bool isConnected() => connected;
}
