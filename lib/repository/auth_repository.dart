import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_scouter/util/logger.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository());

class AuthRepository {
  AuthRepository();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  User? getCurrentUser() {
    try {
      return _auth.currentUser;
    } catch (e) {
      return null;
    }
  }

  // アカウント作成
  Future createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      logger.w(e.toString());
    }
  }

  // ログイン
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      logger.w(e.toString());
    }
  }

  Future logout() async {
    await _auth.signOut();
  }

  Future deleteUser() async {
    await _auth.currentUser?.delete();
  }
}
