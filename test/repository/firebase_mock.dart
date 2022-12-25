import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_template/repository/firestore/firebase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseRepositoryMockProvider =
    Provider((ref) => FirebaseRepositoryMock());

class FirebaseRepositoryMock implements FirebaseRepository {
  @override
  // TODO: implement firestore
  FirebaseFirestore get firestore => throw UnimplementedError();

  @override
  Future setMatch(String userId, List<String> partyNameList,
      List<String> divisorList, Map<String, String> eachMemo) {
    // TODO: implement setMatch
    throw UnimplementedError();
  }
}
