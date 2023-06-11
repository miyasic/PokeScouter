import 'package:flutter/material.dart';
import 'package:poke_scouter/feature/battle_suggest_state.dart';
import 'package:poke_scouter/presentation/top/top_page_state.dart';
import 'package:poke_scouter/providers/auth_controller.dart';
import 'package:poke_scouter/repository/firestore/firebase.dart';
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
  late final ScrollController scrollController;
  static const _scrollValueThreshold = 0.8;

  Future _init() async {
    state = state.copyWith(loading: true);
    _initializeScrollController();
    await fetchBattles();
    state = state.copyWith(loading: false);
  }

  fetchBattles() async {
    final user = authController.state;
    if (user == null) {
      return;
    }
    final battles = await firebaseRepository.fetchBattles(user.uid);
    final battleWithSimilarity = _generateBattleWithSimilarity(battles);
    final filteredBattleWithSimilarity =
        _filterBattleWithSimilarity(battleWithSimilarity);
    final sortedBattleWithSimilarity =
        _sortBattleWithSimilarity(filteredBattleWithSimilarity);
    state = state.copyWith(battles: sortedBattleWithSimilarity);
  }

  List<BattleWithSimilarity> _generateBattleWithSimilarity(
      List<Battle> battles) {
    return battles.map((battle) {
      final List<List<String>> battleDivisorList = [
        battle.divisorList6,
        battle.divisorList5,
        battle.divisorList4,
        battle.divisorList3,
        battle.divisorList2,
        battle.divisorList1
      ];
      var similarity = 0;

      for (var i = 0; i < 6; i++) {
        final List<String> targetDivisor = divisorList[i];
        final List<String> battleDivisor = battleDivisorList[i];
        if (targetDivisor.any((divisor) => battleDivisor.contains(divisor))) {
          similarity = 6 - i;
          break;
        }
      }

      return (battle: battle, similarity: similarity);
    }).toList();
  }

  List<BattleWithSimilarity> _filterBattleWithSimilarity(
      List<BattleWithSimilarity> battleWithSimilarity) {
    return battleWithSimilarity
        .where((battle) => battle.similarity > 3)
        .toList();
  }

  List<BattleWithSimilarity> _sortBattleWithSimilarity(
      List<BattleWithSimilarity> battleWithSimilarity) {
    battleWithSimilarity.sort((a, b) {
      if (a.similarity == b.similarity) {
        final aDateTime = a.battle.createdAt.dateTime;
        final bDateTime = b.battle.createdAt.dateTime;
        if (aDateTime != null && bDateTime != null) {
          return bDateTime.compareTo(aDateTime);
        }
      }
      return b.similarity.compareTo(a.similarity);
    });
    return battleWithSimilarity;
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
