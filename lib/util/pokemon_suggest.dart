import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:poke_scouter/util/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/pokemon.dart';

final pokemonSuggestStateProvider =
    StateNotifierProvider<PokemonSuggestStateNotifier, PokemonSuggest>((ref) {
  final rawData = ref.read(pokemonRawDataProvider);
  return PokemonSuggestStateNotifier(PokemonSuggest.first(rawData));
});

class PokemonSuggestStateNotifier extends StateNotifier<PokemonSuggest> {
  PokemonSuggestStateNotifier(super.state);

  void setSuggestPokemonName(String input) {
    final katakanaInput = _hiraganaToKatakana(input);
    final suggestPokemonName = state.pokemonNameList
        .where((element) => element.startsWith(katakanaInput))
        .toList();
    state = state.copyWith(suggestPokemonNameList: suggestPokemonName);
  }

  List<String> getSuggestPokemonName(String input) {
    final katakanaInput = _hiraganaToKatakana(input);
    final suggestPokemonName = state.pokemonNameList
        .where((element) => element.startsWith(katakanaInput))
        .toList();
    return suggestPokemonName;
  }

  Pokemon? getPokemon(String name) {
    try {
      return state.pokemonMap[name];
    } catch (e) {
      logger.w('存在しないポケモンが選択されました。');
      return null;
    }
  }

  int getSuggestPokemonCount() {
    return state.suggestPokemonNameList.length;
  }

  _hiraganaToKatakana(val) {
    return val.replaceAllMapped(RegExp("[ぁ-ゔ]"),
        (Match m) => String.fromCharCode(m.group(0)!.codeUnitAt(0) + 0x60));
  }
}

@immutable
class PokemonSuggest {
  const PokemonSuggest(
      {required this.pokemonNameList,
      required this.pokemonMap,
      required this.suggestPokemonNameList,
      required this.userInput});
  final List<String> pokemonNameList;
  final Map<String, Pokemon> pokemonMap;
  final List<String> suggestPokemonNameList;
  final String userInput;

  factory PokemonSuggest.first(String loadData) {
    final Map<String, Pokemon> pokemonMap = toJsonList(loadData);
    return PokemonSuggest(
        pokemonNameList: pokemonMap.keys.toList(),
        pokemonMap: pokemonMap,
        suggestPokemonNameList: const [],
        userInput: "");
  }

  PokemonSuggest copyWith(
      {List<String>? pokemonNameList,
      Map<String, Pokemon>? pokemonMap,
      List<String>? suggestPokemonNameList,
      String? userInput}) {
    return PokemonSuggest(
        pokemonNameList: pokemonNameList ?? this.pokemonNameList,
        pokemonMap: pokemonMap ?? this.pokemonMap,
        suggestPokemonNameList:
            suggestPokemonNameList ?? this.suggestPokemonNameList,
        userInput: userInput ?? this.userInput);
  }

  static Map<String, Pokemon> toJsonList(String data) {
    Map<String, dynamic> map = jsonDecode(data);
    map.forEach((key, value) {
      Pokemon.fromJson(value);
    });
    final pokemon =
        map.map((key, value) => MapEntry(key, Pokemon.fromJson(value)));
    return pokemon;
  }
}

final pokemonRawDataProvider =
    Provider<String>((_) => throw UnimplementedError());

Future<String> get getPokemonRawData async {
  return await rootBundle.loadString('json/pokemon.json');
}
