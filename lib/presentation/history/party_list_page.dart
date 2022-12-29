import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/Widget/party_widget.dart';
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
                if (parties[index].partyNameList.isEmpty) return SizedBox();
                return PartyWidget(parties[index]);
              });
            },
            error: (e, __) {
              print(e.toString());
              return const SizedBox(child: Text("error"),);
            },
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
    );
  }
}
