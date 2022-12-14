import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_template/constants/route_path.dart';
import 'package:flutter_template/domain/pokemon.dart';
import 'package:flutter_template/scaffold_messenger.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../util/logger.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void toJsonList(String data) {
      final dataList = data.split('}, {');
      print(dataList.length);
      print(dataList);
      Map<String, dynamic> map = jsonDecode("{${dataList[15]}}");
      print(map);
      final pokemon15 = Pokemon.fromJson(map);
      print(pokemon15);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(kPageNameTop),
      ),
      body: Center(
          child: InkWell(
              onTap: () async {
                logger.d("test");
                final loadData = await rootBundle.loadString('json/data.json');
                toJsonList(loadData);
                ref.watch(scaffoldMessengerHelperProvider).showSnackBar("test");
                context.push(kPagePathNext);
              },
              child: const Text(kPageNameTop))),
    );
  }
}
