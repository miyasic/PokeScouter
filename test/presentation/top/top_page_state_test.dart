import 'package:flutter_template/presentation/top/top_page_state.dart';
import 'package:flutter_template/util/pokemon_suggest.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../container.dart';

void main() {
  late ProviderContainer _container;

  setUp(() async {
    _container = await overrideRepository();
  });

  test("ポケモン追加のテスト", () async {
    final pokemon = _container
        .read(pokemonSuggestStateProvider.notifier)
        .getPokemon('ピカチュウ');
    _container.read(pokemonListProvider.notifier).addPokemon(pokemon);
    final state = _container.read(pokemonListProvider);
    expect(state.length, 1);
    expect(state[0].name, 'ピカチュウ');
  });
}
