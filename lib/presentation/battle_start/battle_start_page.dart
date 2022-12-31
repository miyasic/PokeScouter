import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/constants/route_path.dart';
import 'package:flutter_template/presentation/Widget/pokemon_textfield.dart';
import 'package:flutter_template/presentation/Widget/pokemon_widget.dart';
import 'package:flutter_template/presentation/top/top_page_state.dart';
import 'package:flutter_template/util/pokemon_suggest.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/pokemon.dart';

class BattleStartPage extends HookConsumerWidget {
  const BattleStartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonListNotifier =
        ref.read(pokemonListProvider(kPageNameBattleStart).notifier);
    List<Pokemon> pokemonListState =
        ref.watch(pokemonListProvider(kPageNameBattleStart));
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
          ElevatedButton(
            onPressed: () {
              context.push(kPagePathBattleSuggest);

              // pokemonListState.isEmpty
              // ? null
              // : () async {
              //     ref
              //         .read(
              //             pokemonListProvider(kPageNameBattleStart).notifier)
              //         .setParty(
              //             title: "パーティの名前",
              //             showLoginDialog: () async {
              //               await showConfirmDialog(
              //                   context: context,
              //                   title: 'ログインしてください。',
              //                   okText: 'ログインページを開く。',
              //                   message: '過去の対戦を表示するにはログインが必要です。',
              //                   function: () {
              //                     context.push(kPagePathLogin);
              //                   });
              //             });
            },
            child: const Text("過去の対戦"),
          ),
        ],
      ),
    );
  }
}
