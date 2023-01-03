import 'package:flutter/material.dart';
import 'package:flutter_template/feature/battle_history.dart';
import 'package:flutter_template/presentation/Widget/battle_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BattleHistoryPage extends ConsumerWidget {
  const BattleHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(battleHistoryProvider);
    print(state.loading);
    if (state.loading) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: ListView.builder(
          controller: ref.read(battleHistoryProvider.notifier).scrollController,
          itemCount: state.battles.length,
          itemBuilder: (BuildContext context, int index) {
            return BattleWidget(
              battle: state.battles[index],
            );
          }),
    );
  }
}
