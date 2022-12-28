import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/constants/text_style.dart';
import 'package:flutter_template/domain/firebase/party.dart';

import '../../domain/pokemon.dart';

class PartyWidget extends HookWidget {
  const PartyWidget(this.party, {super.key});

  final Party party;

  @override
  Widget build(BuildContext context) {
    final folded = useState(false);
    String formatNumbers(String num) {
      const spaceLater = "  ";
      return spaceLater * (3 - num.length) + num;
    }
    if(party.partyNameList.isEmpty){
      return Card(
        child: Text("ポケモンが登録されていません。"),
      );
    }
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Wrap(
              children: party.partyNameList.map((name) => Text(name,style: textStylePlain,)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
