import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/auth_repository.dart';
import '../scaffold_messenger.dart';

final authControllerProvider =
    StateNotifierProvider.autoDispose<AuthController, User?>(
  (ref) => AuthController(ref.read(authRepositoryProvider), ref),
);

class AuthController extends StateNotifier<User?> {
  AuthController(this.authRepository, this.ref) : super(null);
  final AuthRepository authRepository;
  final AutoDisposeStateNotifierProviderRef ref;

  @override
  User? get state => authRepository.getCurrentUser();

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> signIn(
      {required String email,
      required String password,
      required Function onCompleted}) async {
    try {
      checkInputText(email, password);
      await authRepository.signInWithEmailAndPassword(email, password);
      onCompleted();
    } on String catch (text) {
      ref
          .watch(scaffoldMessengerHelperProvider)
          .showSnackBar(text, isWarningMessage: true);
    } catch (e) {
      ref
          .watch(scaffoldMessengerHelperProvider)
          .showSnackBar(e.toString(), isWarningMessage: true);
    }
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required Function onCompleted}) async {
    try {
      checkInputText(email, password);
      await authRepository.createUserWithEmailAndPassword(email, password);
      onCompleted();
    } on String catch (text) {
      ref
          .watch(scaffoldMessengerHelperProvider)
          .showSnackBar(text, isWarningMessage: true);
    } catch (e) {
      ref
          .watch(scaffoldMessengerHelperProvider)
          .showSnackBar(e.toString(), isWarningMessage: true);
    }
    // Firestoreにユーザデータを追加したり
  }

  checkInputText(String email, String password) {
    if (!EmailValidator.validate(email)) {
      throw 'emailの形式が不適切です。';
    }
    if (password.length < 6) {
      throw 'パスワードは6文字以上にしてください。';
    }
  }

  Future<void> signOut() async {
    await authRepository.logout();
  }
}
