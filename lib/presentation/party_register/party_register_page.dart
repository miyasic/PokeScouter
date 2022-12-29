import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/constants/route_path.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/pokemon.dart';
import '../../util/pokemon_suggest.dart';
import '../Widget/pokemon_textfield.dart';
import '../Widget/pokemon_widget.dart';
import '../Widget/show_dialog.dart';
import '../top/top_page_state.dart';

class PartyRegisterPage extends HookConsumerWidget {
  const PartyRegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonListNotifier =
        ref.read(pokemonListProvider(kPageNamePartyRegister).notifier);
    List<Pokemon> pokemonListState =
        ref.watch(pokemonListProvider(kPageNamePartyRegister));
    return Scaffold(
      appBar: AppBar(
        title: const Text(kPageNamePartyRegister),
        actions: [
          IconButton(
            onPressed: () {
              context.push(kPagePathLogin);
            },
            icon: const Icon(Icons.login),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            PokemonTextField(
              onSelected: (String pokemonName) {
                pokemonListNotifier.addPokemon(ref
                    .read(pokemonSuggestStateProvider.notifier)
                    .getPokemon(pokemonName));
              },
            ),
            Expanded(
              child: ReorderableListView.builder(
                itemCount: pokemonListState.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    key: ValueKey(pokemonListState[index].toJson()),
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
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
                  : () async {
                      await showTextFieldDialog(
                          context: context,
                          title: "パーティの名前を決めてね。",
                          okText: '登録する。',
                          function: (String title) async {
                            final navigator = Navigator.of(context);
                            await ref
                                .read(
                                    pokemonListProvider(kPageNamePartyRegister)
                                        .notifier)
                                .setParty(
                                    title: title,
                                    showLoginDialog: () async {
                                      await showConfirmDialog(
                                          context: context,
                                          title: 'ログインしてください。',
                                          okText: 'ログインページを開く。',
                                          message: 'パーティを登録するにはログインが必要です。',
                                          function: () {
                                            context.push(kPagePathLogin);
                                          });
                                    });
                            navigator.pop();
                          });
                    },
              child: const Text("パーティ登録"),
            ),
          ],
        ),
      ),
    );
  }
}
