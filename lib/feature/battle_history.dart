import 'package:flutter/material.dart';
import 'package:poke_scouter/constants/firestore.dart';
import 'package:poke_scouter/feature/battle_history_state.dart';
import 'package:poke_scouter/providers/auth_controller.dart';
import 'package:poke_scouter/repository/firestore/firebase.dart';
import 'package:poke_scouter/scaffold_messenger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/firebase/battle.dart';

final battleHistoryProvider =
    StateNotifierProvider<BattleHistory, BattleHistoryState>((ref) {
  return BattleHistory(
      firebaseRepository: ref.read(firebaseRepositoryProvider),
      authController: ref.read(authControllerProvider.notifier),
      scaffoldMessengerHelper: ref.read(scaffoldMessengerHelperProvider))
    .._init();
});

class BattleHistory extends StateNotifier<BattleHistoryState> {
  BattleHistory(
      {required this.firebaseRepository,
      required this.authController,
      required this.scaffoldMessengerHelper})
      : super(const BattleHistoryState());
  final FirebaseRepository firebaseRepository;
  final AuthController authController;
  final ScaffoldMessengerHelper scaffoldMessengerHelper;
  late final ScrollController scrollController;
  static const _scrollValueThreshold = 0.8;

  Future _init() async {
    _initializeScrollController();
    await fetchBattles();
    state = state.copyWith(loading: false);
  }

  fetchBattles() async {
    final user = authController.state;
    if (user == null) {
      return;
    }
    if (state.battles.length > kLimitFetchAllBattles) {
      scaffoldMessengerHelper
          .showSnackBar('$kLimitFetchAllBattles件以上のバトルを取得しました。これ以上は取得できません。');
      return;
    }
    final qs = await firebaseRepository.loadBattles(user.uid,
        lastReadQueryDocumentSnapshot: state.lastReadQueryDocumentSnapshot);

    final List<Battle> newBattles = qs.docs.map((qds) => qds.data()).toList();
    if (newBattles.isNotEmpty) {
      state = state.copyWith(
          battles: [...state.battles, ...newBattles],
          lastReadQueryDocumentSnapshot: qs.docs.last);
    }
  }

  refresh() async {
    state = state.copyWith(
      loading: true,
      battles: [],
      lastReadQueryDocumentSnapshot: null,
    );

    await fetchBattles();
    state = state.copyWith(loading: false);
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
