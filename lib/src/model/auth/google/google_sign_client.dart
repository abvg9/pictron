import 'package:google_sign_in/google_sign_in.dart';
import 'package:pictron/src/model/auth/sign_client.dart';

class GoogleSignClient extends SignClient {
  GoogleSignClient() {
    connected = false;
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
    _currentUser = await _googleSignIn.signIn().catchError((Object e) {
      throw e;
    });

    token = await _currentUser.authentication
        .then((GoogleSignInAuthentication googleKey) => googleKey.idToken)
        .catchError((Object e) {
      throw e;
    });

    connected = true;
  }

  @override
  Future<void> handleSignOut() async {
    await _googleSignIn.disconnect().catchError((Object e) {
      throw e;
    });

    connected = false;
  }

  Future<void> _initialize() async {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      _currentUser = account;
    });
    connected = true;
    await _googleSignIn.signInSilently();
  }
}
