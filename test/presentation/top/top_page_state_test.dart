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

  test("ポケモン追加のテスト(成功)", () async {
    final pokemon = _container
        .read(pokemonSuggestStateProvider.notifier)
        .getPokemon('ピカチュウ');
    _container.read(pokemonListProvider.notifier).addPokemon(pokemon);
    final state = _container.read(pokemonListProvider);
    expect(state.length, 1);
    expect(state[0].name, 'ピカチュウ');
  });

  test("ポケモン追加のテスト(失敗)", () async {
    final pokemon = _container
        .read(pokemonSuggestStateProvider.notifier)
        .getPokemon('ぴかちゅう');
    _container.read(pokemonListProvider.notifier).addPokemon(pokemon);
    final state = _container.read(pokemonListProvider);
    expect(state.length, 0);
  });

  test("ポケモン削除(成功)", () async {
    final pokemon = _container
        .read(pokemonSuggestStateProvider.notifier)
        .getPokemon('ピカチュウ');
    _container.read(pokemonListProvider.notifier).addPokemon(pokemon);
    final state = _container.read(pokemonListProvider);
    expect(state.length, 1);
    expect(state[0].name, 'ピカチュウ');
    _container.read(pokemonListProvider.notifier).removePokemon(0);

    expect(_container.read(pokemonListProvider).length, 0);
  });

  test("ポケモン削除(失敗)", () async {
    _container.read(pokemonListProvider.notifier).removePokemon(0);
    expect(_container.read(pokemonListProvider).length, 0);
  });

  test("ポケモン順序変更のテスト1", () async {
    final pokemonSuggest =
        _container.read(pokemonSuggestStateProvider.notifier);
    _container
        .read(pokemonListProvider.notifier)
        .addPokemon(pokemonSuggest.getPokemon('ピチュー'));
    _container
        .read(pokemonListProvider.notifier)
        .addPokemon(pokemonSuggest.getPokemon('ピカチュウ'));
    _container
        .read(pokemonListProvider.notifier)
        .addPokemon(pokemonSuggest.getPokemon('ライチュウ'));

    _container.read(pokemonListProvider.notifier).reorderList(0, 3);
    final state = _container.read(pokemonListProvider);
    expect(state.length, 3);
    expect(state[0].name, 'ピカチュウ');
    expect(state[1].name, 'ライチュウ');
    expect(state[2].name, 'ピチュー');
  });

  test("ポケモン順序変更のテスト2", () async {
    final pokemonSuggest =
        _container.read(pokemonSuggestStateProvider.notifier);
    _container
        .read(pokemonListProvider.notifier)
        .addPokemon(pokemonSuggest.getPokemon('ピチュー'));
    _container
        .read(pokemonListProvider.notifier)
        .addPokemon(pokemonSuggest.getPokemon('ピカチュウ'));
    _container
        .read(pokemonListProvider.notifier)
        .addPokemon(pokemonSuggest.getPokemon('ライチュウ'));

    _container.read(pokemonListProvider.notifier).reorderList(2, 0);
    final state = _container.read(pokemonListProvider);
    expect(state.length, 3);
    expect(state[0].name, 'ライチュウ');
    expect(state[1].name, 'ピチュー');
    expect(state[2].name, 'ピカチュウ');
  });
}
