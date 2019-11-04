import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignClient {
  GoogleSignClient() {
    _googleSignIn = GoogleSignIn(
      scopes: <String>[
        'email',
      ],
    );
    _initialize();
  }

  GoogleSignInAccount _currentUser;
  GoogleSignIn _googleSignIn;

  Future<void> handleSignIn() async {
    await _googleSignIn.signIn();
  }

  Future<void> handleSignOut() async {
    await _googleSignIn.disconnect();
  }

  void _initialize() {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      _currentUser = account;
    });
    _googleSignIn.signInSilently();
  }
}
