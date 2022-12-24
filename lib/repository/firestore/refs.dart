import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_template/constants/firestore.dart';
import 'package:flutter_template/domain/firebase/party.dart';
import 'package:flutter_template/domain/firebase/user.dart';

final db = FirebaseFirestore.instance;

/// appUsers コレクションの参照。
final usersRef = db.collection(kUserCollection).withConverter(
  fromFirestore: (ds, _) {
    return User.fromDocumentSnapshot(ds);
  },
  toFirestore: (obj, _) {
    final json = obj.toJson();
    return json;
  },
);

/// appUser ドキュメントの参照。
DocumentReference<User> userRef({
  required String userId,
}) =>
    usersRef.doc(userId);

final partiesRef = db.collection(kPartyCollection).withConverter(
    fromFirestore: (ds, _) => Party.fromDocumentSnapshot(ds),
    toFirestore: (obj, _) => obj.toJson());

DocumentReference<Party> partyRef({
  required partyId,
}) =>
    partiesRef.doc(partyId);
