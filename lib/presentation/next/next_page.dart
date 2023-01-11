import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_scouter/constants/route_path.dart';
import 'package:poke_scouter/constants/text_style.dart';

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kPageNameMy),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            kPageNameMy,
            style: textStylePlain,
          ),
          Text("textStyleLarge", style: textStyleLarge),
          Text("textStyleMedium", style: textStyleMedium),
          Text("textStylePlane", style: textStylePlain),
          Text("textStyleBold", style: textStyleBold),
          const Text("textStyleNon")
        ],
      )),
    );
  }
}
