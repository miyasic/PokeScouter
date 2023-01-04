import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/text_style.dart';
import '../../domain/firebase/battle.dart';
import '../../domain/firebase/party.dart';

class BattleWidget extends ConsumerWidget {
  const BattleWidget({super.key, required this.battle, this.pokemonNameList});

  final Battle battle;
  final List<String>? pokemonNameList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isContains(String name) {
      if (pokemonNameList == null) {
        return false;
      }
      return pokemonNameList!.contains(name);
    }

    return Card(
        child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(battle.result)),
              Text(
                battle.createdAt.dateTime.toString(),
                style: textStyleGreySmall,
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "相手のパーティ",
            style: textStyleBold,
          ),
          Wrap(
            children: battle.opponentParty
                .map((name) => Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: Text(
                        name,
                        style: textStylePlain.copyWith(
                            color:
                                isContains(name) ? Colors.black : Colors.red),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "相手の選出",
            style: textStyleBold,
          ),
          Wrap(
            children: battle.order
                .map((index) => Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: Text(
                        battle.opponentParty[index],
                        style: textStylePlain.copyWith(
                            color: isContains(battle.opponentParty[index])
                                ? Colors.black
                                : Colors.red),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    ));
  }
}
