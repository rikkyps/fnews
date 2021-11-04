part of 'services.dart';

class AuthServices {
  static final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn();
  static GoogleSignInAccount? _user;

  static Future<ReturnValue> loginWithEmail(
      String email, String password) async {
    try {
      final auth.UserCredential firebaseUser = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      auth.User? result = firebaseUser.user;
      if (result?.uid != null) {
        saveUid(result!.uid);
        return ReturnValue(value: result.email);
      } else {
        return ReturnValue(message: 'Email atau password salah');
      }
    } catch (e) {
      return ReturnValue(message: 'Gagal');
    }
  }

  static Future<ReturnValue> loginWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return ReturnValue(message: 'Login Gagal!');
    } else {
      _user = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await _firebaseAuth.signInWithCredential(credential);
      saveUid(_user!.id);
      return ReturnValue(value: _user!.email);
    }
  }

  static Future<void> saveUid(String uid) async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();

    _pref.setString('uid', uid);
  }

  static Future<void> deleteUid() async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();

    _pref.remove('uid');
  }

  static Future<void> logOut() async {
    await _firebaseAuth.signOut();
    await deleteUid();
  }
}
