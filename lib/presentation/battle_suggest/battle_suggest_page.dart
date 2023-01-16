import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_scouter/constants/route_path.dart';
import 'package:poke_scouter/feature/battle_suggest.dart';
import 'package:poke_scouter/presentation/Widget/battle_widget.dart';
import 'package:poke_scouter/presentation/top/top_page_state.dart';

import '../../repository/admob_repository.dart';

class BattleSuggestPage extends ConsumerWidget {
  const BattleSuggestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonListNotifier =
        ref.read(pokemonListProvider(kPageNameBattleStart));
    final battleSuggestState = ref.watch(battleSuggestProvider);
    final admobState = ref.watch(admobRepositoryProvider);
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
                    pokemonNameList: pokemonListNotifier
                        .map((pokemon) => pokemon.name)
                        .toList(),
                  );
                }),
          ),
          ElevatedButton(
            child: const Text("対戦登録に進む"),
            onPressed: () async {
              await admobState.showAd(() {
                context.push(kPagePathBattleMemo);
              });
            },
          ),
        ],
      ),
    );
  }
}
