import 'package:badges/badges.dart';
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
    late TextEditingController textEditingController;
    return Scaffold(
      appBar: AppBar(
        title: const Text(kPageNameTop),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Autocomplete(
              optionsBuilder: (textEditingValue) {
                if (textEditingValue.text == "") {
                  return <String>[];
                }
                return ref
                    .read(pokemonSuggestStateProvider.notifier)
                    .getSuggestPokemonName(textEditingValue.text);
              },
              onSelected: (String pokemonName) {
                pokemon.value = [
                  ...pokemon.value
                    ..add(ref
                        .read(pokemonSuggestStateProvider.notifier)
                        .getPokemon(pokemonName))
                ];
              },
              fieldViewBuilder: (BuildContext context,
                  TextEditingController fieldTextEditingController,
                  FocusNode fieldFocusNode,
                  VoidCallback onFieldSubmitted) {
                textEditingController = fieldTextEditingController;
                return TextField(
                  controller: textEditingController,
                  focusNode: fieldFocusNode,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: textEditingController.clear,
                      icon: Icon(Icons.clear),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ReorderableListView.builder(
              itemCount: pokemon.value.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  key: ValueKey(pokemon.value[index]),
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: InkWell(
                      onDoubleTap: () {
                        pokemon.value = [...pokemon.value..removeAt(index)];
                      },
                      child: Badge(
                          position: BadgePosition.topStart(),
                          badgeColor: Theme.of(context).primaryColorDark,
                          badgeContent: Text((index + 1).toString()),
                          child: PokemonWidget(pokemon.value[index]))),
                );
              },
              onReorder: (int oldIndex, int newIndex) {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final Pokemon item = pokemon.value.removeAt(oldIndex);
                pokemon.value = [...pokemon.value..insert(newIndex, item)];
              },
            ),
          ),
        ],
      ),
    );
  }
}
