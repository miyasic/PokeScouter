import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/constants/route_path.dart';
import 'package:flutter_template/constants/text_style.dart';
import 'package:flutter_template/scaffold_messenger.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/pokemon.dart';
import '../Widget/pokemon_widget.dart';
import '../Widget/show_dialog.dart';
import '../top/top_page_state.dart';

class BattleMemoPage extends HookConsumerWidget {
  const BattleMemoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonListNotifier =
        ref.read(pokemonListProvider(kPageNameBattleStart).notifier);
    final List<Pokemon> pokemonListState =
        ref.watch(pokemonListProvider(kPageNameBattleStart));
    final order = useState<List<int>>([]);

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
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: InkWell(
                        onDoubleTap: () {
                          if (!order.value.contains(index)) {
                            order.value = [...order.value, index];
                          } else {
                            ref
                                .read(scaffoldMessengerHelperProvider)
                                .showSnackBar('既に登録されているポケモンです。',
                                    isWarningMessage: true);
                          }
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
            Text(
              '対戦相手の選出',
              style: textStyleBold,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: order.value.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: InkWell(
                        onDoubleTap: () {},
                        child: Badge(
                            position: BadgePosition.topStart(),
                            badgeColor: Theme.of(context).primaryColorDark,
                            badgeContent: Text((index + 1).toString()),
                            child: PokemonWidget(
                                pokemonListState[order.value[index]]))),
                  );
                }),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(pokemonListProvider(kPageNameBattleStart).notifier)
                    .setBattle(
                        order: order.value,
                        showLoginDialog: () async {
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
