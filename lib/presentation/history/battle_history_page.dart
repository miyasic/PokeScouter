import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BattleHistoryPage extends ConsumerWidget {
  const BattleHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(child: Text("対戦履歴")),
    );
  }
}
