import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:poke_scouter/constants/route_path.dart';
import 'package:poke_scouter/presentation/Widget/pokemon_textfield.dart';
import 'package:poke_scouter/presentation/Widget/pokemon_widget.dart';
import 'package:poke_scouter/presentation/Widget/tutorial_widget.dart';
import 'package:poke_scouter/presentation/top/top_page_state.dart';
import 'package:poke_scouter/providers/tutorial_provider.dart';
import 'package:poke_scouter/util/pokemon_suggest.dart';
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
    final showFirstTutorial = ref.watch(showFirstTutorialProvider);
    final showTutorial = ref.watch(showBattleStartTutorialProvider);
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text(kPageNameBattleStart),
            actions: [
              IconButton(
                onPressed: () {
                  ref.read(showBattleStartTutorialProvider.notifier).state =
                      true;
                },
                icon: const Icon(Icons.help),
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
                onPressed: pokemonListState.isEmpty
                    ? null
                    : () {
                        context.push(kPagePathBattleSuggest);
                        primaryFocus?.unfocus();
                      },
                child: const Text("過去の対戦"),
              ),
            ],
          ),
        ),
        TutorialWidget(
          onTap: () {
            ref.read(showBattleStartTutorialProvider.notifier).state = false;
          },
          show: !showFirstTutorial && showTutorial,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("ポケスカウターには「対戦」・「履歴」・「マイページ」の3つのタブがあります。"),
              Text("このページは対戦タブの対戦開始画面です。"),
              Text("対戦開始画面では上部のテキストボックスにポケモンの名前を入力することで各種ステータスが確認できます。"),
              Text(
                  "ポケモン対戦をする際は選出画面で相手のポケモンの名前を全て入力することで、過去に似たようなパーティとの対戦の記録を確認することができます。"),
            ],
          ),
        ),
        TutorialWidget(
          onTap: () {
            ref.read(showFirstTutorialProvider.notifier).state = false;
          },
          show: showFirstTutorial,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("アプリのインストールありがとうございます。"),
              Text("初回記事同時にはヘルプを表示しています。次回以降は右上の?マークから確認できます。"),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
