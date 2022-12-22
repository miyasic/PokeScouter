import 'package:flutter/material.dart';
import 'package:flutter_template/constants/text_style.dart';

import '../../domain/pokemon.dart';

class PokemonWidget extends StatelessWidget {
  const PokemonWidget(this.pokemon, {super.key});
  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    String formatNumbers(String num) {
      const spaceLater = "  ";
      return spaceLater * (3 - num.length) + num;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      Text(
                        pokemon.name,
                        style: textStyleLarge,
                      ),
                    ],
                  ),
                  Wrap(
                    children: [
                      const Text("タイプ:"),
                      const SizedBox(
                        width: 4,
                      ),
                      Text("${pokemon.type1} ${pokemon.type2}"),
                    ],
                  ),
                  Wrap(
                    children: [
                      const Text("とくせい:"),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                          "${pokemon.ability1} ${pokemon.ability2} ${pokemon.hiddenAbility}"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("H:${formatNumbers(pokemon.h)}"),
                          Text("A:${formatNumbers(pokemon.a)}"),
                          Text("B:${formatNumbers(pokemon.b)}"),
                        ],
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "C:${formatNumbers(pokemon.c)}",
                          ),
                          Text("D:${formatNumbers(pokemon.d)}"),
                          Text("S:${formatNumbers(pokemon.s)}"),
                        ],
                      ),
                    ],
                  ),
                  Text("Total:${pokemon.sum}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
