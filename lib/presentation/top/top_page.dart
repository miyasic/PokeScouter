import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/constants/route_path.dart';
import 'package:flutter_template/presentation/Widget/pokemon_widget.dart';
import 'package:flutter_template/util/pokemon_suggest.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/pokemon.dart';

class TopPage extends HookConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemon = useState<List<Pokemon>>([]);
    return Scaffold(
      appBar: AppBar(
        title: const Text(kPageNameTop),
      ),
      body: ListView.builder(
        itemCount: pokemon.value.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Autocomplete(
              optionsBuilder: (textEditingValue) {
                if (textEditingValue.text == "") {
                  return <String>[];
                }
                return ref
                    .read(pokemonSuggestStateProvider.notifier)
                    .getSuggestPokemonName(textEditingValue.text);
              },
              onSelected: (String pokemonName) {
                pokemon.value = [...pokemon.value..add(ref
                    .read(pokemonSuggestStateProvider.notifier)
                    .getPokemon(pokemonName))];
              },
            );
          }
          return InkWell(
              onDoubleTap: () {
                pokemon.value = [...pokemon.value..removeAt(index - 1)];
              },
              child: PokemonWidget(pokemon.value[index - 1]));
        },
      ),
    );
  }
}
