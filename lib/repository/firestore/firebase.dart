import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_template/constants/firestore.dart';
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
    final partyDoc = userRef(userId: userId).collection(kPartyCollection).doc();
    final party = Party(
        userId: userId,
        partyId: partyDoc.id,
        name: name,
        partyNameList: partyNameList,
        divisorList: divisorList,
        memo: memo,
        eachMemo: eachMemo);
    final data = party.toJson();
    await partyDoc.set(data);
  }

  Stream<List<Party>> subscribeParties(String userId) {
    final collectionStream = partiesRef(userId: userId).snapshots();
    return collectionStream.map((qs) => qs.docs.map((qds) => qds.data()).toList());
  }
}
