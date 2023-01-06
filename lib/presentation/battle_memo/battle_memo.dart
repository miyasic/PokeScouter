import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/constants/firestore.dart';
import 'package:flutter_template/constants/route_path.dart';
import 'package:flutter_template/constants/text_style.dart';
import 'package:flutter_template/feature/party.dart';
import 'package:flutter_template/scaffold_messenger.dart';
import 'package:flutter_template/util/pokemon_suggest.dart';
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
    final List<Pokemon> pokemonListState =
        ref.watch(pokemonListProvider(kPageNameBattleStart));
    final opponentOrder = useState<List<int>>([]);
    final myOrder = useState<List<int>>([]);
    final myOrderNameList = useState<List<String>>([]);
    final memoController = useTextEditingController();
    final result = useState<BattleResult>(BattleResult.win);
    return Scaffold(
      appBar: AppBar(
        title: const Text(kPageNameBattleMemo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Text(
                '対戦相手のパーティ',
                style: textStyleBold,
              )
            ])),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: InkWell(
                      onDoubleTap: () {
                        if (!opponentOrder.value.contains(index)) {
                          opponentOrder.value = [...opponentOrder.value, index];
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
                          child: PokemonWidget(
                            pokemonListState[index],
                            initialFolded: true,
                          ))),
                );
              },
              childCount: pokemonListState.length,
            )),
            SliverList(
                delegate: SliverChildListDelegate([
              Text(
                '対戦相手の選出',
                style: textStyleBold,
              )
            ])),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: InkWell(
                      onDoubleTap: () {
                        opponentOrder.value.removeAt(index);
                        opponentOrder.value = [...opponentOrder.value];
                      },
                      child: Badge(
                          position: BadgePosition.topStart(),
                          badgeColor: Theme.of(context).primaryColorDark,
                          badgeContent: Text((index + 1).toString()),
                          child: PokemonWidget(
                            pokemonListState[opponentOrder.value[index]],
                            initialFolded: true,
                          ))),
                );
              },
              childCount: opponentOrder.value.length,
            )),
            SliverList(
                delegate: SliverChildListDelegate([
              Text(
                '自分のパーティ',
                style: textStyleBold,
              ),
            ])),
            SliverList(
              delegate: ref.watch(partyFutureProvider).when(
                  data: (party) {
                    if (party == null) {
                      return SliverChildListDelegate(
                          [const Text("パーティが選択されていません")]);
                    }
                    return SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final pokemon = ref
                            .read(pokemonSuggestStateProvider.notifier)
                            .getPokemon(party.partyNameList[index]);
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: InkWell(
                              onDoubleTap: () {
                                if (!myOrder.value.contains(index)) {
                                  myOrder.value = [...myOrder.value, index];
                                  myOrderNameList.value = [
                                    ...myOrderNameList.value,
                                    party.partyNameList[index]
                                  ];
                                } else {
                                  ref
                                      .read(scaffoldMessengerHelperProvider)
                                      .showSnackBar('既に登録されているポケモンです。',
                                          isWarningMessage: true);
                                }
                              },
                              child: Badge(
                                  position: BadgePosition.topStart(),
                                  badgeColor:
                                      Theme.of(context).primaryColorDark,
                                  badgeContent: Text((index + 1).toString()),
                                  child: PokemonWidget(
                                    pokemon!,
                                    initialFolded: true,
                                  ))),
                        );
                      },
                      childCount: party.partyNameList.length,
                    );
                    // return PartyWidget(party, false);
                  },
                  error: (e, __) {
                    return SliverChildListDelegate([
                      const SizedBox(
                        child: Text("error"),
                      )
                    ]);
                  },
                  loading: () => SliverChildListDelegate(
                      [const Center(child: CircularProgressIndicator())])),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Text(
                '自分の選出',
                style: textStyleBold,
              ),
            ])),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: InkWell(
                      onDoubleTap: () {
                        myOrder.value.removeAt(index);
                        myOrder.value = [...myOrder.value];
                        myOrderNameList.value.removeAt(index);
                        myOrderNameList.value = [...myOrderNameList.value];
                      },
                      child: Badge(
                          position: BadgePosition.topStart(),
                          badgeColor: Theme.of(context).primaryColorDark,
                          badgeContent: Text((index + 1).toString()),
                          child: Text(myOrderNameList.value[index]))),
                );
              },
              childCount: myOrder.value.length,
            )),
            SliverList(
                delegate: SliverChildListDelegate([
              Text(
                '対戦メモ',
                style: textStyleBold,
              ),
              TextField(
                controller: memoController,
                minLines: 5,
                maxLines: 10,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              Wrap(
                spacing: 10,
                children: [
                  ChoiceChip(
                    label: const Text("勝利"),
                    selected: result.value == BattleResult.win,
                    backgroundColor: Colors.grey[600],
                    selectedColor: Colors.white,
                    onSelected: (_) {
                      result.value = BattleResult.win;
                    },
                  ),
                  ChoiceChip(
                    label: const Text("引き分け"),
                    selected: result.value == BattleResult.draw,
                    backgroundColor: Colors.grey[600],
                    selectedColor: Colors.white,
                    onSelected: (_) {
                      result.value = BattleResult.draw;
                    },
                  ),
                  ChoiceChip(
                    label: const Text("負け"),
                    selected: result.value == BattleResult.lose,
                    backgroundColor: Colors.grey[600],
                    selectedColor: Colors.white,
                    onSelected: (_) {
                      result.value = BattleResult.lose;
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  await ref
                      .read(pokemonListProvider(kPageNameBattleStart).notifier)
                      .setBattle(
                          memo: memoController.text,
                          myPartyNameList: myOrderNameList.value,
                          opponentOrder: opponentOrder.value,
                          myOrder: myOrder.value,
                          result: result.value,
                          showLoginDialog: () async {
                            await showConfirmDialog(
                                context: context,
                                title: 'ログインしてください。',
                                okText: 'ログインページを開く。',
                                message: '過去の対戦を表示するにはログインが必要です。',
                                function: () {
                                  context.push(kPagePathLogin);
                                });
                          },
                          onComplete: () {
                            context.go(kPagePathBattleStart);
                          });
                },
                child: const Text("対戦を登録する"),
              )
            ])),
          ], //子にSliverたちを並べていく
        ),
      ),
    );
  }
}
