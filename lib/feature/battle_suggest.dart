import 'package:flutter/material.dart';
import 'package:poke_scouter/feature/battle_suggest_state.dart';
import 'package:poke_scouter/presentation/top/top_page_state.dart';
import 'package:poke_scouter/providers/auth_controller.dart';
import 'package:poke_scouter/repository/firestore/firebase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/firestore.dart';
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
  late final ScrollController scrollController;
  static const _scrollValueThreshold = 0.8;

  Future _init() async {
    _initializeScrollController();
    await fetchBattles();
  }

  fetchBattles() async {
    if (state.sameStatus == BattleSuggestStatus.threeSame) {
      return;
    }
    final user = authController.state;
    if (user == null) {
      return;
    }
    var divisor = divisorList[state.sameStatus.getIndex()];
    if (divisor.length > 10) {
      divisor = divisor.take(10).toList();
    }
    final qs = await firebaseRepository.loadBattlesWithDivisorList(
        userId: user.uid,
        divisorList: divisor,
        lastReadQueryDocumentSnapshot: state.lastReadQueryDocumentSnapshot,
        status: state.sameStatus);
    final List<Battle> newBattles = qs.docs.map((qds) => qds.data()).toList();
    if (newBattles.isNotEmpty && newBattles.length == kLimitLoadBattles) {
      state = state.copyWith(
          battles: [...state.battles, ...newBattles],
          lastReadQueryDocumentSnapshot: qs.docs.last);
    } else {
      state = state.copyWith(
          sameStatus: state.sameStatus.getNext(),
          lastReadQueryDocumentSnapshot: null);

      await fetchBattles();
    }
  }

  void _initializeScrollController() {
    scrollController = ScrollController()
      ..addListener(() async {
        final scrollValue =
            scrollController.offset / scrollController.position.maxScrollExtent;
        if (scrollValue > _scrollValueThreshold) {
          await fetchBattles();
        }
      });
  }
}
