import 'package:flutter/material.dart';
import 'package:flutter_template/constants/route_path.dart';
import 'package:flutter_template/util/pokemon_suggest.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../../util/logger.dart';

class TopPage extends HookConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pokemonSuggestStateProvider);
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
                // ref.watch(scaffoldMessengerHelperProvider).showSnackBar("test");
                // context.push(kPagePathNext);
              },
              child: const Text(kPageNameTop)),
          TextField(
            onChanged: (String input) {
              ref
                  .read(pokemonSuggestStateProvider.notifier)
                  .setSuggestPokemonName(input);
            },
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: ref
                .read(pokemonSuggestStateProvider.notifier)
                .getSuggestPokemonCount(), // この行を追加
            itemBuilder: (BuildContext context, int index) {
              return Text(state.suggestPokemonNameList[index]);
            },
          )
        ],
      )),
    );
  }
}
