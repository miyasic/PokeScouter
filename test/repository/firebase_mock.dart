import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_template/domain/firebase/battle.dart';
import 'package:flutter_template/domain/firebase/party.dart';
import 'package:flutter_template/feature/battle_suggest_state.dart';
import 'package:flutter_template/repository/firestore/firebase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseRepositoryMockProvider =
    Provider((ref) => FirebaseRepositoryMock());

class FirebaseRepositoryMock implements FirebaseRepository {
  @override
  // TODO: implement firestore
  FirebaseFirestore get firestore => throw UnimplementedError();

  @override
  Stream<List<Party>> subscribeParties(String userId) {
    // TODO: implement subscribeParties
    throw UnimplementedError();
  }

  @override
  Future setBattle(
      {required String userId,
      required String partyId,
      required List<String> opponentParty,
      required List<List<String>> divisorList,
      required List<int> order,
      required String memo,
      required Map<String, String> eachMemo,
      required String result}) {
    // TODO: implement setBattle
    throw UnimplementedError();
  }

  @override
  Future<String> setParty(
      {required String userId,
      required String name,
      required List<String> partyNameList,
      required List<List<String>> divisorList,
      required String memo,
      required Map<String, String> eachMemo}) {
    // TODO: implement setParty
    throw UnimplementedError();
  }

  @override
  Future<QuerySnapshot<Battle>> loadBattles(String userId,
      {required QueryDocumentSnapshot<Battle>? lastReadQueryDocumentSnapshot}) {
    // TODO: implement loadBattles
    throw UnimplementedError();
  }

  @override
  Future<QuerySnapshot<Battle>> loadBattlesWithDivisorList(
      {required String userId,
      required List<String> divisorList,
      required QueryDocumentSnapshot<Battle>? lastReadQueryDocumentSnapshot,
      required BattleSuggestStatus status}) {
    // TODO: implement loadBattlesWithDivisorList
    throw UnimplementedError();
  }
}
