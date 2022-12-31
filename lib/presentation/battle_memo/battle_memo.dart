import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_template/constants/route_path.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BattleMemoPage extends ConsumerWidget {
  const BattleMemoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kPageNameBattleMemo),
      ),
      body: ElevatedButton(
        child: Text("次へ"),
        onPressed: () {
          context.push(kPagePathBattleMemo);
        },
      ),
    );
  }
}
