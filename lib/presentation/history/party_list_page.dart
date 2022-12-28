import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../feature/party.dart';

class PartyListPage extends ConsumerWidget {
  const PartyListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(roomsStreamProvider).when(
            data: (parties) {
              return ListView.builder(
                  itemCount: parties.length,
                  itemBuilder: (BuildContext context, int index){
                if (parties[index].partyNameList.length == 0) return Text("ポケモンが登録されていません");
                return Text(parties[index].partyNameList[0]);
              });
            },
            error: (e, __) {
              print(e.toString());
              return const SizedBox(child: Text("error"),);
            },
            loading: () => Center(child: const CircularProgressIndicator()),
          ),
    );
  }
}
