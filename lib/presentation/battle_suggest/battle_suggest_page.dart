import 'package:flutter/material.dart';
import 'package:flutter_template/constants/route_path.dart';
import 'package:flutter_template/feature/battle_suggest.dart';
import 'package:flutter_template/presentation/Widget/battle_widget.dart';
import 'package:flutter_template/presentation/top/top_page_state.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BattleSuggestPage extends ConsumerWidget {
  const BattleSuggestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonListNotifier =
        ref.read(pokemonListProvider(kPageNameBattleStart).notifier);
    final battleSuggestState = ref.watch(battleSuggestProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(kPageNameBattleSuggest),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                controller:
                    ref.read(battleSuggestProvider.notifier).scrollController,
                itemCount: battleSuggestState.battles.length,
                itemBuilder: (BuildContext context, int index) {
                  return BattleWidget(
                    battle: battleSuggestState.battles[index],
                  );
                }),
          ),
          ElevatedButton(
            child: const Text("対戦登録に進む"),
            onPressed: () {
              context.push(kPagePathBattleMemo);
            },
          ),
        ],
      ),
    );
  }
}
