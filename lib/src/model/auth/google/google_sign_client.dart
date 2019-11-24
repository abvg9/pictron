import 'package:google_sign_in/google_sign_in.dart';
import 'package:pictron/src/model/auth/sign_client.dart';

class GoogleSignClient extends SignClient {
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
  GoogleSignInAuthentication _googleSignInAuthentication;

  @override
  Future<void> handleSignIn() async {
    await _googleSignIn.signIn();
    _googleSignInAuthentication = await _currentUser.authentication;
  }

  @override
  Future<void> handleSignOut() async {
    await _googleSignIn.disconnect();
  }

  void _initialize() {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      _currentUser = account;
    });
    _googleSignIn.signInSilently();
  }

  @override
  Object getToken() => _googleSignInAuthentication.accessToken;
}
