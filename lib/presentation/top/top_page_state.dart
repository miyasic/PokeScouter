import 'package:flutter_template/domain/pokemon.dart';
import 'package:flutter_template/repository/firestore/firebase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pokemonListProvider =
    StateNotifierProvider<PokemonListState, List<Pokemon>>(
        (ref) => PokemonListState(ref.read(firebaseRepositoryProvider)));

class PokemonListState extends StateNotifier<List<Pokemon>> {
  PokemonListState(this.firebaseRepository) : super([]);
  final FirebaseRepository firebaseRepository;

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

  List<String> getPokemonNameList() {
    return state.map((pokemon) => pokemon.name).toList();
  }

  List<String> getPokemonDivisorList() {
    return ["未実装"];
  }

  setParty() {
    firebaseRepository.setMatch(
        'hoge', getPokemonNameList(), getPokemonDivisorList(), Map());
  }
}
