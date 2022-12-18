import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/constants/route_path.dart';
import 'package:flutter_template/domain/pokemon.dart';
import 'package:flutter_template/scaffold_messenger.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter/services.dart' show rootBundle;

import '../../util/logger.dart';

class TopPage extends HookConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonList = useState<List<Pokemon>>([]);
    final pokemonNameList = useState<List<String>>([]);
    final suggestPokemonNameList = useState<List<String>>([]);
    Map<String, Pokemon> toJsonList(String data) {
      Map<String, dynamic> map = jsonDecode(data);
      map.forEach((key, value) {
        Pokemon.fromJson(value);
      });
      final pokemon =
          map.map((key, value) => MapEntry(key, Pokemon.fromJson(value)));
      print(pokemon);
      print(pokemon["レックウザ"]);

      pokemonNameList.value = pokemon.keys.toList();
      return pokemon;
    }

    setSuggestPokemonName(String input) {
      suggestPokemonNameList.value = pokemonNameList.value
          .where((element) => element.startsWith(input))
          .toList();
      print(suggestPokemonNameList.value);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(kPageNameTop),
      ),
      body: Center(
          child: Column(
        children: [
          InkWell(
              onTap: () async {
                logger.d("test");
                final loadData =
                    await rootBundle.loadString('json/pokemon.json');
                toJsonList(loadData);
                // ref.watch(scaffoldMessengerHelperProvider).showSnackBar("test");
                // context.push(kPagePathNext);
              },
              child: const Text(kPageNameTop)),
          TextField(
            onChanged: (String input) {
              setSuggestPokemonName(input);
            },
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: suggestPokemonNameList.value.length, // この行を追加
            itemBuilder: (BuildContext context, int index) {
              return Text(suggestPokemonNameList.value[index]);
            },
          )
        ],
      )),
    );
  }
}
