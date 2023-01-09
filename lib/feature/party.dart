import 'package:poke_scouter/domain/firebase/party.dart';
import 'package:poke_scouter/providers/auth_controller.dart';
import 'package:poke_scouter/repository/firestore/firebase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/shared_preferences.dart';
import '../repository/shared_preferences.dart';

/// Party 一覧を購読する StreamProvider。
final partyStreamProvider = StreamProvider.autoDispose((ref) {
  final userId = ref.watch(authControllerProvider)?.uid;
  if (userId == null) {
    return Stream.value(<Party>[]);
  }
  return ref.read(firebaseRepositoryProvider).subscribeParties(userId);
});

final partyFutureProvider = FutureProvider.autoDispose<Party?>((ref) {
  final userId = ref.watch(authControllerProvider)?.uid;
  final partyId =
      ref.read(sharedPreferencesProvider).get(kSharedPrefsPartyId) as String?;
  if (userId == null || partyId == null) {
    return Future.value(null);
  }
  return ref.read(firebaseRepositoryProvider).fetchParty(userId, partyId);
});

final someProvider = FutureProvider.autoDispose((ref) async {
  await Future<void>.delayed(const Duration(seconds: 2));

  // `doubleEnabledProvider`が更新されると、参照元である`someProvider`が再評価される
  // つまり、`doubleEnabledProvider`が更新される度にAsyncLoadingクラスを経由する
  return Future.value(42);
});
