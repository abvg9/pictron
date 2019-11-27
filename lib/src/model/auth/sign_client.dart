abstract class SignClient {
  String token;

  Future<void> handleSignIn();
  Future<void> handleSignOut();

  String getToken() {
    print(token);
    return token;
  }
}
