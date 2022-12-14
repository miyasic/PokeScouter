import 'package:flutter/material.dart';
import 'package:flutter_template/constants/route_path.dart';
import 'package:flutter_template/scaffold_messenger.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../util/logger.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kPageNameTop),
      ),
      body: Center(
          child: InkWell(
              onTap: () {
                logger.d("test");
                ref.watch(scaffoldMessengerHelperProvider).showSnackBar("test");
                context.push(kPagePathNext);
              },
              child: const Text(kPageNameTop))),
    );
  }
}
