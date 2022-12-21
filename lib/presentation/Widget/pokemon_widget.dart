import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/constants/text_style.dart';

import '../../domain/pokemon.dart';

class PokemonWidget extends StatelessWidget {
  const PokemonWidget(this.pokemon, {super.key});
  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
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
                      Text("タイプ:"),
                      SizedBox(
                        width: 4,
                      ),
                      Text("${pokemon.type1} ${pokemon.type2}"),
                    ],
                  ),
                  Wrap(
                    children: [
                      Text("とくせい:"),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                          "${pokemon.ability1} ${pokemon.ability2} ${pokemon.hiddenAbility}"),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 4,),
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(shape: BoxShape.rectangle,borderRadius: BorderRadius.circular(4),  border: Border.all(),),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("H:${pokemon.h}"),
                          Text("A:${pokemon.a}"),
                          Text("B:${pokemon.b}"),
                        ],
                      ),
                      SizedBox(width: 4,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("C:${pokemon.c}"),
                          Text("D:${pokemon.d}"),
                          Text("S:${pokemon.s}"),
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
