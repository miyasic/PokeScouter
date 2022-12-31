import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_template/domain/firebase/party.dart';
import 'package:flutter_template/repository/firestore/firebase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseRepositoryMockProvider =
    Provider((ref) => FirebaseRepositoryMock());

class FirebaseRepositoryMock implements FirebaseRepository {
  @override
  Future<String> setParty(
      {required String userId,
      required String name,
      required List<String> partyNameList,
      required List<String> divisorList,
      required String memo,
      required Map<String, String> eachMemo}) {
    // TODO: implement setParty
    throw UnimplementedError();
  }

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
      required List<String> divisorList,
      required List<int> order,
      required String memo,
      required Map<String, String> eachMemo,
      required String result}) {
    // TODO: implement setBattle
    throw UnimplementedError();
  }
}
