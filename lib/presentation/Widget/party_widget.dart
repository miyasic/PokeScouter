import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/constants/text_style.dart';
import 'package:flutter_template/domain/firebase/party.dart';

class PartyWidget extends HookWidget {
  const PartyWidget(this.party, {super.key});

  final Party party;

  @override
  Widget build(BuildContext context) {
    if (party.partyNameList.isEmpty) {
      return const SizedBox();
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
                Text(party.name),
                Text(
                  party.createdAt.dateTime.toString(),
                  style: textStyleGreySmall,
                )
              ],
            ),
            Wrap(
              children: party.partyNameList
                  .map((name) => Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: Text(
                          name,
                          style: textStylePlain,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
