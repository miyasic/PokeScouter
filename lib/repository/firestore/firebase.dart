import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_template/constants/firestore.dart';
import 'package:flutter_template/domain/firebase/battle.dart';
import 'package:flutter_template/domain/firebase/party.dart';
import 'package:flutter_template/repository/firestore/refs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseRepositoryProvider =
    Provider<FirebaseRepository>((ref) => FirebaseRepository());

class FirebaseRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future setParty(
      {required String userId,
      required String name,
      required List<String> partyNameList,
      required List<String> divisorList,
      required String memo,
      required Map<String, String> eachMemo}) async {
    final partyDoc = partiesRef(userId: userId).doc();
    final party = Party(
        userId: userId,
        partyId: partyDoc.id,
        name: name,
        partyNameList: partyNameList,
        divisorList: divisorList,
        memo: memo,
        eachMemo: eachMemo);
    await partyDoc.set(party);
  }

  Future setBattle(
      {required String userId,
      required String partyId,
      required List<String> opponentParty,
      required List<String> divisorList,
      required List<int> order,
      required String memo,
      required Map<String, String> eachMemo,
      required String result}) async {
    final battleDoc = battlesRef(userId: userId).doc();
    final battle = Battle(
        userId: userId,
        battleId: battleDoc.id,
        opponentParty: opponentParty,
        divisorList: divisorList,
        order: order,
        memo: memo,
        eachMemo: eachMemo,
        result: result);
    await battleDoc.set(battle);
  }

  Stream<List<Party>> subscribeParties(String userId) {
    final collectionStream = partiesRef(userId: userId)
        .orderBy(kFieldPartyCreatedAt, descending: true)
        .snapshots();
    return collectionStream
        .map((qs) => qs.docs.map((qds) => qds.data()).toList());
  }
}
