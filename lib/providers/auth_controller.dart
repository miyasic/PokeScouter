import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/auth_repository.dart';

final authControllerProvider =
    StateNotifierProvider.autoDispose<AuthController, User?>(
  (ref) => AuthController(ref.read(authRepositoryProvider)),
);

class AuthController extends StateNotifier<User?> {
  AuthController(this.authRepository) : super(null);
  final AuthRepository authRepository;

  @override
  User? get state => authRepository.getCurrentUser();

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> signIn(String email, String password) async {
    try {
      await authRepository.signInWithEmailAndPassword(email, password);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> signUp(String email, String password) async {
    await authRepository.createUserWithEmailAndPassword(email, password);
    // Firestoreにユーザデータを追加したり
  }

  Future<void> signOut() async {
    await authRepository.logout();
  }
}
