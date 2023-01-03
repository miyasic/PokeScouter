import 'package:flutter/material.dart';
import 'package:flutter_template/constants/text_style.dart';
import 'package:flutter_template/feature/battle_history.dart';
import 'package:flutter_template/presentation/Widget/battle_widget.dart';
import 'package:flutter_template/providers/auth_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BattleHistoryPage extends ConsumerWidget {
  const BattleHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(battleHistoryProvider);
    final uid = ref.read(authControllerProvider)?.uid;
    if (uid == null) {
      return Center(
        child: Text(
          "ログインしてください",
          style: textStyleGreyPlain,
        ),
      );
    }
    if (state.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.battles.isEmpty) {
      return Center(
        child: Text(
          "対戦履歴がありません",
          style: textStyleGreyPlain,
        ),
      );
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
