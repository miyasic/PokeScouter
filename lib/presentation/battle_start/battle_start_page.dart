import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:poke_scouter/constants/route_path.dart';
import 'package:poke_scouter/presentation/Widget/pokemon_textfield.dart';
import 'package:poke_scouter/presentation/Widget/pokemon_widget.dart';
import 'package:poke_scouter/presentation/top/top_page_state.dart';
import 'package:poke_scouter/util/pokemon_suggest.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../domain/pokemon.dart';

final GlobalKey key1 = GlobalKey();
final GlobalKey key2 = GlobalKey();

class BattleStartPage extends HookConsumerWidget {
  const BattleStartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonListNotifier =
        ref.read(pokemonListProvider(kPageNameBattleStart).notifier);
    List<Pokemon> pokemonListState =
        ref.watch(pokemonListProvider(kPageNameBattleStart));
    List<TargetFocus> targets = [];
    targets.add(TargetFocus(identify: "Target 1", keyTarget: key1, contents: [
      TargetContent(
          align: ContentAlign.bottom,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Titulo lorem ipsum",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ))
    ]));
    targets.add(TargetFocus(identify: "Target 1", keyTarget: key2, contents: [
      TargetContent(
          align: ContentAlign.bottom,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Titulo lorem ipsum",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ))
    ]));
    useEffect(() {
      TutorialCoachMark(targets: targets).show(context: context);
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
              key: key2,
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
            key: key1,
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
    );
  }
}
