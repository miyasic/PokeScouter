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
      Map<String, dynamic> map = jsonDecode(data);
      map.forEach((key, value) {
        Pokemon.fromJson(value);
      });
      final pokemon =
          map.map((key, value) => MapEntry(key, Pokemon.fromJson(value)));
      print(pokemon);
      print(pokemon["レックウザ"]);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(kPageNameTop),
      ),
      body: Center(
          child: InkWell(
              onTap: () async {
                logger.d("test");
                final loadData =
                    await rootBundle.loadString('json/pokemon.json');
                toJsonList(loadData);
                ref.watch(scaffoldMessengerHelperProvider).showSnackBar("test");
                context.push(kPagePathNext);
              },
              child: const Text(kPageNameTop))),
    );
  }
}
