import 'package:flutter/material.dart';
import 'package:poke_scouter/feature/battle_suggest_state.dart';
import 'package:poke_scouter/presentation/top/top_page_state.dart';
import 'package:poke_scouter/providers/auth_controller.dart';
import 'package:poke_scouter/repository/firebase_functions_repository.dart';
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
      firebaseFunctionsRepository:
          ref.read(firebaseFunctionsRepositoryProvider),
      divisorList: divisorList)
    .._init();
});

typedef BattleWithSimilarity = ({Battle battle, int similarity});

class BattleSuggest extends StateNotifier<BattleSuggestState> {
  BattleSuggest(
      {required this.authController,
      required this.firebaseRepository,
      required this.firebaseFunctionsRepository,
      required this.divisorList})
      : super(const BattleSuggestState());
  final AuthController authController;
  final FirebaseRepository firebaseRepository;
  final FirebaseFunctionsRepository firebaseFunctionsRepository;
  final List<List<String>> divisorList;
  late final ScrollController scrollController;
  static const _scrollValueThreshold = 0.8;

  Future _init() async {
    _initializeScrollController();
    await fetchBattles();
  }

  fetchBattles() async {
    final user = authController.state;
    if (user == null) {
      return;
    }
    final battles = await firebaseRepository.fetchBattles(user.uid);
    final battleWithSimilarity = generateBattleWithSimilarity(battles);
    final filteredBattleWithSimilarity =
        filterBattleWithSimilarity(battleWithSimilarity);
    final sortedBattleWithSimilarity =
        sortBattleWithSimilarity(filteredBattleWithSimilarity);
    final sortedBattles = getBattlesFromRecord(sortedBattleWithSimilarity);
    state = state.copyWith(battles: sortedBattles);
  }

  List<BattleWithSimilarity> generateBattleWithSimilarity(
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

  List<BattleWithSimilarity> filterBattleWithSimilarity(
      List<BattleWithSimilarity> battleWithSimilarity) {
    return battleWithSimilarity
        .where((battle) => battle.similarity > 3)
        .toList();
  }

  List<BattleWithSimilarity> sortBattleWithSimilarity(
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

  List<Battle> getBattlesFromRecord(
      List<BattleWithSimilarity> battleWithSimilarity) {
    return battleWithSimilarity.map((battle) => battle.battle).toList();
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
