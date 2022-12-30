import 'package:flutter_template/presentation/top/top_page_state.dart';
import 'package:flutter_template/util/pokemon_suggest.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../container.dart';

void main() {
  late ProviderContainer container;

  setUp(() async {
    container = await overrideRepository();
  });

  test("ポケモン追加のテスト(成功)", () async {
    final pokemon = container
        .read(pokemonSuggestStateProvider.notifier)
        .getPokemon('ピカチュウ');
    container.read(pokemonListProvider("test").notifier).addPokemon(pokemon);
    final state = container.read(pokemonListProvider("test"));
    expect(state.length, 1);
    expect(state[0].name, 'ピカチュウ');
  });

  test("ポケモン追加のテスト(失敗)", () async {
    final pokemon = container
        .read(pokemonSuggestStateProvider.notifier)
        .getPokemon('ぴかちゅう');
    container.read(pokemonListProvider("test").notifier).addPokemon(pokemon);
    final state = container.read(pokemonListProvider("test"));
    expect(state.length, 0);
  });

  test("ポケモン削除(成功)", () async {
    final pokemon = container
        .read(pokemonSuggestStateProvider.notifier)
        .getPokemon('ピカチュウ');
    container.read(pokemonListProvider("test").notifier).addPokemon(pokemon);
    final state = container.read(pokemonListProvider("test"));
    expect(state.length, 1);
    expect(state[0].name, 'ピカチュウ');
    container.read(pokemonListProvider("test").notifier).removePokemon(0);

    expect(container.read(pokemonListProvider("test")).length, 0);
  });

  test("ポケモン削除(失敗)", () async {
    container.read(pokemonListProvider("test").notifier).removePokemon(0);
    expect(container.read(pokemonListProvider("test")).length, 0);
  });

  test("ポケモン順序変更のテスト1", () async {
    final pokemonSuggest = container.read(pokemonSuggestStateProvider.notifier);
    container
        .read(pokemonListProvider("test").notifier)
        .addPokemon(pokemonSuggest.getPokemon('ピチュー'));
    container
        .read(pokemonListProvider("test").notifier)
        .addPokemon(pokemonSuggest.getPokemon('ピカチュウ'));
    container
        .read(pokemonListProvider("test").notifier)
        .addPokemon(pokemonSuggest.getPokemon('ライチュウ'));

    container.read(pokemonListProvider("test").notifier).reorderList(0, 3);
    final state = container.read(pokemonListProvider("test"));
    expect(state.length, 3);
    expect(state[0].name, 'ピカチュウ');
    expect(state[1].name, 'ライチュウ');
    expect(state[2].name, 'ピチュー');
  });

  test("ポケモン順序変更のテスト2", () async {
    final pokemonSuggest = container.read(pokemonSuggestStateProvider.notifier);
    container
        .read(pokemonListProvider("test").notifier)
        .addPokemon(pokemonSuggest.getPokemon('ピチュー'));
    container
        .read(pokemonListProvider("test").notifier)
        .addPokemon(pokemonSuggest.getPokemon('ピカチュウ'));
    container
        .read(pokemonListProvider("test").notifier)
        .addPokemon(pokemonSuggest.getPokemon('ライチュウ'));

    container.read(pokemonListProvider("test").notifier).reorderList(2, 0);
    final state = container.read(pokemonListProvider("test"));
    expect(state.length, 3);
    expect(state[0].name, 'ライチュウ');
    expect(state[1].name, 'ピチュー');
    expect(state[2].name, 'ピカチュウ');
  });
}
