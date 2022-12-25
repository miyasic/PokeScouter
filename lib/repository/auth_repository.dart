import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e);
    }
  }

  // ログイン
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e);
    }
  }

  Future logout() async {
    await _auth.signOut();
  }
}
