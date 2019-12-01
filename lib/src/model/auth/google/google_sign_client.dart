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
    _currentUser = await _googleSignIn.signIn().catchError((Object e) {
      throw AuthError('Google');
    });
  }

  @override
  Future<void> handleSignOut() async {
    await _googleSignIn.disconnect().catchError((Object e) {
      throw AuthError('Google');;
    });
  }

  Future<void> _initialize() async {
    /*
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      _currentUser = account;
      connected = true;
    });
    */
    /*
    _currentUser =
        await _googleSignIn.signInSilently().then((GoogleSignInAccount gsa) {
      connected = true;
      return _currentUser = gsa;
    });
     */
  }

  @override
  Future<String> getToken() async =>
      _currentUser.authentication
          .then((GoogleSignInAuthentication googleKey) => googleKey.idToken)
          .catchError((Object e) {
            throw AuthError('Google');
          });

  @override
  Future<bool> isConnected() =>
      _googleSignIn.isSignedIn().then((bool con) => con).catchError((Object e){
        throw AuthError('Google');
      });
}
