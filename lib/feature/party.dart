import 'package:poke_scouter/domain/firebase/party.dart';
import 'package:poke_scouter/providers/auth_controller.dart';
import 'package:poke_scouter/repository/firestore/firebase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Party 一覧を購読する StreamProvider。
final partyStreamProvider = StreamProvider.autoDispose((ref) {
  final userId = ref.watch(authControllerProvider)?.uid;
  if (userId == null) {
    return Stream.value(<Party>[]);
  }
  return ref.read(firebaseRepositoryProvider).subscribeParties(userId);
});
