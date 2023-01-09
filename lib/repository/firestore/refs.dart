import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poke_scouter/constants/firestore.dart';
import 'package:poke_scouter/domain/firebase/party.dart';
import 'package:poke_scouter/domain/firebase/user.dart';
import '../../domain/firebase/battle.dart';

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

CollectionReference<Party> partiesRef({
  required String userId,
}) =>
    userRef(userId: userId).collection(kPartyCollection).withConverter(
        fromFirestore: (ds, _) => Party.fromDocumentSnapshot(ds),
        toFirestore: (obj, _) => obj.toJson());

DocumentReference<Party> partyRef({
  required userId,
  required partyId,
}) =>
    partiesRef(userId: userId).doc(partyId);

CollectionReference<Battle> battlesRef({
  required String userId,
}) =>
    userRef(userId: userId).collection(kBattleCollection).withConverter(
        fromFirestore: (ds, _) => Battle.fromDocumentSnapshot(ds),
        toFirestore: (obj, _) => obj.toJson());

DocumentReference<Battle> battleRef({
  required userId,
  required battleId,
}) =>
    battlesRef(userId: userId).doc(battleId);
