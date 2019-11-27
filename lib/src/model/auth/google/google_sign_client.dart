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

  @override
  Future<void> handleSignIn() async {
    _currentUser = await _googleSignIn.signIn();
    token = await _currentUser.authentication
        .then((GoogleSignInAuthentication googleKey) => googleKey.idToken);
  }

  @override
  Future<void> handleSignOut() => _googleSignIn.disconnect();

  void _initialize() {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      _currentUser = account;
    });
    _googleSignIn.signInSilently();
  }
}
