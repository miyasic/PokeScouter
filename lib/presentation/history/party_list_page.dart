import 'package:flutter/material.dart';
import 'package:flutter_template/constants/route_path.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PartyListPage extends ConsumerWidget {
  const PartyListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
          child: Text("パーティ一覧")),
    );
  }
}
