import 'package:flutter/material.dart';
import 'package:flutter_template/feature/battle_history_state.dart';
import 'package:flutter_template/providers/auth_controller.dart';
import 'package:flutter_template/repository/firestore/firebase.dart';
import 'package:flutter_template/scaffold_messenger.dart';
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
    // state = state.copyWith(loading: false);
  }

  fetchBattles() async {
    final user = authController.state;
    if (user == null) {
      return;
    }
    final qs = await firebaseRepository.loadBattles(user.uid,
        lastReadQueryDocumentSnapshot: state.lastReadQueryDocumentSnapshot);

    final List<Battle> newBattles = qs.docs.map((qds) => qds.data()).toList();
    if (newBattles.isNotEmpty) {
      state = state.copyWith(
          loading: false,
          battles: [...state.battles, ...newBattles],
          lastReadQueryDocumentSnapshot: qs.docs.last);
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
