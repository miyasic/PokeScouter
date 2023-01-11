import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_scouter/constants/route_path.dart';
import 'package:poke_scouter/presentation/Widget/my_page_widget.dart';

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(kPageNameMy),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            MyPageTile(
                title: 'ログイン',
                icons: Icons.add,
                iconColor: Colors.grey,
                onTap: () {}),
            MyPageTile(
                title: 'ダークモード',
                icons: Icons.add,
                iconColor: Colors.grey,
                onTap: () {}),
            MyPageTile(
                title: 'パーティ登録',
                icons: Icons.add,
                iconColor: Colors.grey,
                onTap: () {}),
          ],
        ));
  }
}
