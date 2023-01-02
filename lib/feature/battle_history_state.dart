import 'package:flutter_template/providers/auth_controller.dart';
import 'package:flutter_template/repository/firestore/firebase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/firebase/battle.dart';

final battleHistoryProvider =
    StateNotifierProvider<BattleHistoryState, List<Battle>>((ref) {
  return BattleHistoryState(
      firebaseRepository: ref.read(firebaseRepositoryProvider),
      authController: ref.read(authControllerProvider.notifier))
    ..fetchBattles();
});

class BattleHistoryState extends StateNotifier<List<Battle>> {
  BattleHistoryState(
      {required this.firebaseRepository, required this.authController})
      : super([]);
  final FirebaseRepository firebaseRepository;
  final AuthController authController;

  fetchBattles() async {
    final user = authController.state;
    if (user == null) {
      return;
    }
    final newBattles = await firebaseRepository.loadBattles(user.uid);
    state = [...state, ...newBattles];
  }
}
