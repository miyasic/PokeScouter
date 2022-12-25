import 'package:flutter_template/domain/pokemon.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pokemonListProvider =
    StateNotifierProvider<PokemonListState, List<Pokemon>>(
        (ref) => PokemonListState());

class PokemonListState extends StateNotifier<List<Pokemon>> {
  PokemonListState() : super([]);

  void addPokemon(Pokemon pokemon) {
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
}
