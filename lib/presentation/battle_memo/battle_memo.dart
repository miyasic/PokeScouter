import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_template/constants/route_path.dart';
import 'package:flutter_template/constants/text_style.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/pokemon.dart';
import '../Widget/pokemon_widget.dart';
import '../Widget/show_dialog.dart';
import '../top/top_page_state.dart';

class BattleMemoPage extends ConsumerWidget {
  const BattleMemoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonListNotifier =
        ref.read(pokemonListProvider(kPageNameBattleStart).notifier);
    List<Pokemon> pokemonListState =
        ref.watch(pokemonListProvider(kPageNameBattleStart));
    return Scaffold(
      appBar: AppBar(
        title: const Text(kPageNameBattleMemo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '対戦相手のパーティ',
              style: textStyleBold,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pokemonListState.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    key: ValueKey(pokemonListState[index]),
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
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(pokemonListProvider(kPageNameBattleStart).notifier)
                    .setBattle(showLoginDialog: () async {
                  await showConfirmDialog(
                      context: context,
                      title: 'ログインしてください。',
                      okText: 'ログインページを開く。',
                      message: '過去の対戦を表示するにはログインが必要です。',
                      function: () {
                        context.push(kPagePathLogin);
                      });
                });
              },
              child: const Text("対戦を登録する"),
            )
          ],
        ),
      ),
    );
  }
}
