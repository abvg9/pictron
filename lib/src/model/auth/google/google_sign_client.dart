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
    _currentUser = await _googleSignIn.signIn();
    _googleSignInAuthentication = await _currentUser.authentication;
  }

  @override
  Future<void> handleSignOut() async {
    _currentUser = await _googleSignIn.disconnect();
  }

  Future<void> _initialize() async {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      _currentUser = account;
    });
    _currentUser = await _googleSignIn.signInSilently();
  }

  @override
  Object getToken() => _googleSignInAuthentication.accessToken;
}
