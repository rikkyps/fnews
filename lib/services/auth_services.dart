part of 'services.dart';

class AuthServices {
  static final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

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
