abstract class SignClient {
  Future<void> handleSignIn();
  Future<void> handleSignOut();
  Object getToken();
}
