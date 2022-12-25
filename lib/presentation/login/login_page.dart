import 'package:flutter/material.dart';
import 'package:flutter_template/constants/route_path.dart';
import 'package:flutter_template/constants/text_style.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kPageNameLogin),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            kPageNameLogin,
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
