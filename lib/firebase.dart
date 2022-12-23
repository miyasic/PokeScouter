import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_template/domain/firebase/party.dart';

class FirebaseRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  setMatch(String userId, List<String> partyNameList, List<String> divisorList,
      Map<String, String> eachMemo) {
    final partyDoc =
        firestore.collection('User').doc(userId).collection('Party').doc();
    final party = Party(
        userId: userId,
        partyId: partyDoc.id,
        partyNameList: partyNameList,
        divisorList: divisorList,
        eachMemo: eachMemo,
        createdAt: FieldValue.serverTimestamp);
    final data = party.toJson();

    partyDoc.set({
      'userId': userId,
      'partyId': partyDoc.id,
      'partyNameList': partyNameList,
      'divisorList': divisorList,
      'eachMemo': eachMemo,
      'createdAt': FieldValue.serverTimestamp
    });
  }
}
