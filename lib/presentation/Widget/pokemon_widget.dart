import 'package:flutter/cupertino.dart';
import 'package:flutter_template/constants/text_style.dart';

import '../../domain/pokemon.dart';

class PokemonWidget extends StatelessWidget {
  const PokemonWidget(this.pokemon, {super.key});
  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              pokemon.name,
              style: textStyleLarge,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "合計種族値:${pokemon.sum}",
              style: textStyleLarge,
            )
          ],
        ),
        Row(
          children: [
            Text("HP:${pokemon.h}"),
            Text("こうげき:${pokemon.a}"),
            Text("ぼうぎょ:${pokemon.b}"),
            Text("とくこう:${pokemon.c}"),
            Text("とくぼう:${pokemon.d}"),
            Text("すばやさ:${pokemon.s}"),
          ],
        ),
        Row(
          children: [
            Text("タイプ:"),
            SizedBox(
              width: 10,
            ),
            Text("${pokemon.type1} ${pokemon.type2}"),
          ],
        ),
        Row(
          children: [
            Text("とくせい:"),
            SizedBox(
              width: 10,
            ),
            Text(
                "${pokemon.ability1} ${pokemon.ability2} ${pokemon.hiddenAbility}"),
          ],
        ),
      ],
    );
  }
}
