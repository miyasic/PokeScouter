import 'package:flutter/material.dart';
import 'package:flutter_template/constants/route_path.dart';
import 'package:flutter_template/presentation/battle_suggest/battle_suggest_state.dart';
import 'package:flutter_template/presentation/top/top_page_state.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BattleSuggestPage extends ConsumerWidget {
  const BattleSuggestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonListNotifier =
        ref.read(pokemonListProvider(kPageNameBattleStart).notifier);
    final battleListState = ref.watch(battleListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(kPageNameBattleSuggest),
      ),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: battleListState.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(battleListState[index].battleId);
              }),
          ElevatedButton(
            child: const Text("次へ"),
            onPressed: () {
              final divisorList = pokemonListNotifier.getPokemonDivisorList();
              print(divisorList);
              // ref.read(battleListProvider.notifier).fetchBattle(
              //     divisorList: , showLoginDialog: () {});
              // context.push(kPagePathBattleMemo);
            },
          ),
        ],
      ),
    );
  }
}
