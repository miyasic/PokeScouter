import 'package:flutter_template/feature/battle_history_state.dart';
import 'package:flutter_template/providers/auth_controller.dart';
import 'package:flutter_template/repository/firestore/firebase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/firebase/battle.dart';

final battleHistoryProvider =
    StateNotifierProvider<BattleHistory, BattleHistoryState>((ref) {
  return BattleHistory(
      firebaseRepository: ref.read(firebaseRepositoryProvider),
      authController: ref.read(authControllerProvider.notifier))
    ..fetchBattles();
});

class BattleHistory extends StateNotifier<BattleHistoryState> {
  BattleHistory(
      {required this.firebaseRepository, required this.authController})
      : super(const BattleHistoryState());
  final FirebaseRepository firebaseRepository;
  final AuthController authController;

  fetchBattles() async {
    final user = authController.state;
    if (user == null) {
      return;
    }
    final qs = await firebaseRepository.loadBattles(user.uid,
        lastReadQueryDocumentSnapshot: state.lastReadQueryDocumentSnapshot);

    final List<Battle> newBattles = qs.docs.map((qds) => qds.data()).toList();
    state = state.copyWith(battles: [...state.battles, ...newBattles]);
  }
}
