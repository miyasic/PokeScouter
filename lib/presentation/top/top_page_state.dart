import 'package:flutter_template/domain/pokemon.dart';
import 'package:flutter_template/providers/auth_controller.dart';
import 'package:flutter_template/repository/firestore/firebase.dart';
import 'package:flutter_template/scaffold_messenger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pokemonListProvider =
    StateNotifierProvider<PokemonListState, List<Pokemon>>((ref) =>
        PokemonListState(
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
    return ["未実装"];
  }

  setParty({required Function showLoginDialog}) async {
    final user = _authController.state;
    if (user == null) {
      await showLoginDialog();
      return;
    }
    await firebaseRepository.setMatch(
        userId: user.uid,
        name: 'パーティのなまえ',
        partyNameList: _getPokemonNameList(),
        divisorList: _getPokemonDivisorList(),
        memo: 'パーティめも',
        eachMemo: {});
    scaffoldMessengerHelper.showSnackBar('登録できました！');
  }
}
