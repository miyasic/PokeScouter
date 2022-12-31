import 'package:flutter/material.dart';
import 'package:flutter_template/constants/text_style.dart';
import 'package:flutter_template/domain/firebase/party.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PartyWidget extends HookConsumerWidget {
  const PartyWidget(this.party, this.selected, {super.key});

  final Party party;
  final bool selected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (party.partyNameList.isEmpty) {
      return const SizedBox();
    }

    return Card(
      shape: selected
          ? const RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.pink,
              ),
            )
          : null,
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
