import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_scouter/constants/route_path.dart';
import 'package:poke_scouter/presentation/Widget/pokemon_textfield.dart';
import 'package:poke_scouter/presentation/Widget/pokemon_widget.dart';
import 'package:poke_scouter/presentation/top/top_page_state.dart';
import 'package:poke_scouter/util/pokemon_suggest.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../domain/pokemon.dart';

final _key1 = GlobalKey();

class BattleStartPage extends HookConsumerWidget {
  BattleStartPage({super.key});

  BuildContext? myContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonListNotifier =
        ref.read(pokemonListProvider(kPageNameBattleStart).notifier);
    List<Pokemon> pokemonListState =
        ref.watch(pokemonListProvider(kPageNameBattleStart));
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => ShowCaseWidget.of(myContext!).startShowCase([_key1]));
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text(kPageNameBattleStart),
        actions: [
          IconButton(
            onPressed: () {
              context.push(kPagePathLogin);
            },
            icon: const Icon(Icons.login),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PokemonTextField(
              enabled: pokemonListState.length < 6,
              onSelected: (String pokemonName) {
                pokemonListNotifier.addPokemon(ref
                    .read(pokemonSuggestStateProvider.notifier)
                    .getPokemon(pokemonName));
              },
            ),
          ),
          Expanded(
            child: ReorderableListView.builder(
              itemCount: pokemonListState.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  key: ValueKey(index),
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: InkWell(
                      onDoubleTap: () {
                        pokemonListNotifier.removePokemon(index);
                      },
                      child: Badge(
                          position: BadgePosition.topStart(),
                          badgeColor: Theme.of(context).primaryColorDark,
                          badgeContent: Text((index + 1).toString()),
                          child: PokemonWidget(pokemonListState[index]))),
                );
              },
              onReorder: (int oldIndex, int newIndex) {
                pokemonListNotifier.reorderList(oldIndex, newIndex);
              },
            ),
          ),
          ShowCaseWidget(
            builder: Builder(
              builder: (context) {
                myContext = context;
                return Showcase(
                  key: _key1,
                  description: 'description',
                  child: ElevatedButton(
                    onPressed: pokemonListState.isEmpty
                        ? () {
                            // ポイント: ハイライトしたいWidgetのKeyを引数に渡す
                            ShowCaseWidget.of(context)?.startShowCase([_key1]);
                          }
                        : () {
                            context.push(kPagePathBattleSuggest);
                            primaryFocus?.unfocus();
                          },
                    child: const Text("過去の対戦"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
