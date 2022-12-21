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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                pokemon.value = [
                  ...pokemon.value
                    ..add(ref
                        .read(pokemonSuggestStateProvider.notifier)
                        .getPokemon(pokemonName))
                ];
                textEditingController.clear();
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
                );
              },
            ),
            ReorderableListView.builder(
              shrinkWrap: true,
              itemCount: pokemon.value.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    key: ValueKey(pokemon.value[index]),
                    onDoubleTap: () {
                      pokemon.value = [...pokemon.value..removeAt(index)];
                    },
                    child: Badge(
                      position: BadgePosition.topStart(),
                        badgeColor: Theme.of(context).primaryColorDark,
                        badgeContent:Text((index + 1).toString()),
                        child: PokemonWidget(pokemon.value[index])));
              },
              onReorder: (int oldIndex, int newIndex) {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final Pokemon item = pokemon.value.removeAt(oldIndex);
                pokemon.value = [...pokemon.value..insert(newIndex, item)];
              },
            ),
          ],
        ),
      ),
    );
  }
}
