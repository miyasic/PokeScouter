import 'package:flutter_template/feature/battle_suggest_state.dart';
import 'package:flutter_template/presentation/top/top_page_state.dart';
import 'package:flutter_template/providers/auth_controller.dart';
import 'package:flutter_template/repository/firestore/firebase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/route_path.dart';
import '../domain/firebase/battle.dart';

final battleSuggestProvider =
    StateNotifierProvider.autoDispose<BattleSuggest, BattleSuggestState>((ref) {
  final divisorList = ref
      .read(pokemonListProvider(kPageNameBattleStart).notifier)
      .getPokemonDivisorList();
  return BattleSuggest(
      authController: ref.read(authControllerProvider.notifier),
      firebaseRepository: ref.read(firebaseRepositoryProvider),
      divisorList: divisorList)
    .._init();
});

class BattleSuggest extends StateNotifier<BattleSuggestState> {
  BattleSuggest(
      {required this.authController,
      required this.firebaseRepository,
      required this.divisorList})
      : super(const BattleSuggestState());
  final AuthController authController;
  final FirebaseRepository firebaseRepository;
  final List<List<String>> divisorList;

  Future _init() async {
    await fetchBattles(divisorList[0]);
  }

  fetchBattles(List<String> divisorList) async {
    final user = authController.state;
    if (user == null) {
      return;
    }
    final qs = await firebaseRepository.loadBattlesWithDivisorList(
        userId: user.uid,
        divisorList: divisorList,
        lastReadQueryDocumentSnapshot: state.lastReadQueryDocumentSnapshot);
    final List<Battle> newBattles = qs.docs.map((qds) => qds.data()).toList();
    if (newBattles.isNotEmpty) {
      state = state.copyWith(
          battles: [...state.battles, ...newBattles],
          lastReadQueryDocumentSnapshot: qs.docs.last);
    }
  }
}
