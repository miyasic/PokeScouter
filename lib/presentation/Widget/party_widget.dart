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
    if(party.partyNameList.isEmpty){
      return Card(
        child: Text("ポケモンが登録されていません。"),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                Text(party.name),
                Row(
                  children: party.partyNameList.map((name) => Text(name,style: textStylePlain,)).toList(),
                ),
              ],
            ),
          ),
        ),
        Text(party.createdAt.dateTime.toString(),style: textStyleGreySmall,)
      ],
    );
  }
}
