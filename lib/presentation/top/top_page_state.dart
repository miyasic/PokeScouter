import 'package:flutter_template/constants/firestore.dart';
import 'package:flutter_template/domain/pokemon.dart';
import 'package:flutter_template/providers/auth_controller.dart';
import 'package:flutter_template/repository/firestore/firebase.dart';
import 'package:flutter_template/scaffold_messenger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trotter/trotter.dart';

final pokemonListProvider =
    StateNotifierProvider.family<PokemonListState, List<Pokemon>, String>(
        (ref, id) => PokemonListState(
            ref.read(firebaseRepositoryProvider),
            ref.read(authControllerProvider.notifier),
            ref.read(scaffoldMessengerHelperProvider)));

class PokemonListState extends StateNotifier<List<Pokemon>> {
  PokemonListState(this.firebaseRepository, this._authController,
      this.scaffoldMessengerHelper)
      : super([]);
  final FirebaseRepository firebaseRepository;
  final AuthController _authController;
  final ScaffoldMessengerHelper scaffoldMessengerHelper;

  void addPokemon(Pokemon? pokemon) {
    if (pokemon == null) return;
    state = [...state, pokemon];
  }

  void removePokemon(int index) {
    final length = state.length;
    state = [
      for (var i = 0; i < length; i++)
        if (i != index) state[i],
    ];
  }

  void reorderList(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final Pokemon item = state.removeAt(oldIndex);
    state = [...state..insert(newIndex, item)];
  }

  List<String> _getPokemonNameList() {
    return state.map((pokemon) => pokemon.name).toList();
  }

  List<String> _getPokemonDivisorList() {
    final primeNumbers =
        state.map((pokemon) => BigInt.parse(pokemon.primeNumber)).toList();

    final primeNumbersComplemented = [
      ...primeNumbers,
      ...List.filled(6 - primeNumbers.length, BigInt.one)
    ];

    final List<String> divisorList = [];
    for (int i = 6; i >= 1; i--) {
      final combinationIndexes = Combinations(i, List.generate(6, (j) => j));
      for (final indexes in combinationIndexes()) {
        final result = indexes
            .map((index) => primeNumbersComplemented[index])
            .toList()
            .fold(
                BigInt.one, (previousValue, element) => previousValue * element)
            .toString();

        if (!divisorList.contains(result)) divisorList.add(result);
      }
    }
    return divisorList;
  }

  setParty({required String title, required Function showLoginDialog}) async {
    final user = _authController.state;
    if (user == null) {
      await showLoginDialog();
      return;
    }
    await firebaseRepository.setParty(
        userId: user.uid,
        name: title,
        partyNameList: _getPokemonNameList(),
        divisorList: _getPokemonDivisorList(),
        memo: 'パーティめも',
        eachMemo: {});
    state = [];
    scaffoldMessengerHelper.showSnackBar('登録できました！');
  }

  setBattle(
      {required String memo,
      required List<int> order,
      required BattleResult result,
      required Function showLoginDialog}) async {
    final user = _authController.state;
    if (user == null) {
      await showLoginDialog();
      return;
    }
    await firebaseRepository.setBattle(
        userId: user.uid,
        partyId: 'partyId',
        opponentParty: _getPokemonNameList(),
        divisorList: _getPokemonDivisorList(),
        order: order,
        memo: memo,
        eachMemo: {},
        result: result.toString());
  }
}
