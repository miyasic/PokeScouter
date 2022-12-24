import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_template/constants/firestore.dart';
import 'package:flutter_template/domain/firebase/party.dart';
import 'package:flutter_template/repository/firestore/refs.dart';

class FirebaseRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  setMatch(String userId, List<String> partyNameList, List<String> divisorList,
      Map<String, String> eachMemo) {
    final partyDoc = userRef(userId: userId).collection(kPartyCollection).doc();
    final party = Party(
        userId: userId,
        partyId: partyDoc.id,
        partyNameList: partyNameList,
        divisorList: divisorList,
        eachMemo: eachMemo);
    final data = party.toJson();
    partyDoc.set(data);
  }
}
