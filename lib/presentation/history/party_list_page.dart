import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/constants/route_path.dart';
import 'package:flutter_template/presentation/Widget/party_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/shared_preferences.dart';
import '../../feature/party.dart';
import '../../repository/shared_preferences.dart';

class PartyListPage extends HookConsumerWidget {
  const PartyListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPartyId =
        useState(ref.read(sharedPreferencesProvider).get(kSharedPrefsPartyId));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.push(kPagePathPartyRegister);
        },
      ),
      body: ref.watch(partyStreamProvider).when(
            data: (parties) {
              return ListView.builder(
                  itemCount: parties.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (parties[index].partyNameList.isEmpty) {
                      return const SizedBox();
                    }
                    return InkWell(
                        onTap: () async {
                          await ref.read(sharedPreferencesProvider).setString(
                              kSharedPrefsPartyId, parties[index].partyId);
                          selectedPartyId.value = parties[index].partyId;
                        },
                        child: PartyWidget(parties[index],
                            parties[index].partyId == selectedPartyId.value));
                  });
            },
            error: (e, __) {
              return const SizedBox(
                child: Text("error"),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
    );
  }
}
