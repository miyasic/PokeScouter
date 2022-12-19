import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/constants/route_path.dart';
import 'package:flutter_template/presentation/Widget/pokemon_widget.dart';
import 'package:flutter_template/util/pokemon_suggest.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../../domain/pokemon.dart';
import '../../util/logger.dart';

class TopPage extends HookConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pokemonSuggestStateProvider);
    final pokemon = useState<Pokemon>(const Pokemon(
      name: "",
      number: "",
      h: "",
      a: "",
      b: "",
      c: "",
      d: "",
      s: "",
      sum: "",
    ));
    return Scaffold(
      appBar: AppBar(
        title: const Text(kPageNameTop),
      ),
      body: Center(
          child: Column(
        children: [
          Autocomplete(
            optionsBuilder: (textEditingValue) {
              if (textEditingValue.text == "") {
                return <String>[];
              }
              return ref
                  .read(pokemonSuggestStateProvider.notifier)
                  .getSuggestPokemonName(textEditingValue.text);
            },
            onSelected: (String pokemonName) {
              pokemon.value = ref
                  .read(pokemonSuggestStateProvider.notifier)
                  .getPokemon(pokemonName);
            },
          ),
          PokemonWidget(pokemon.value)
        ],
      )),
    );
  }
}
