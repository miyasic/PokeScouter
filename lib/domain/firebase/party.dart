import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../util/union_timestamp.dart';

part 'party.freezed.dart';
part 'party.g.dart';

@freezed
class Party with _$Party {
  const factory Party({
    required String userId,
    required String partyId,
    required List<String> partyNameList,
    required List<String> divisorList,
    required Map<String, String> eachMemo,
    @alwaysUseServerTimestampUnionTimestampConverter
    @Default(UnionTimestamp.serverTimestamp())
        UnionTimestamp createdAt,
  }) = _Party;

  factory Party.fromJson(Map<String, Object?> json) => _$PartyFromJson(json);

  factory Party.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return Party.fromJson(<String, dynamic>{...data, 'partyId': ds.id});
  }
}
