import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../util/json_converter.dart';

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
    @TimestampConverter() required Timestamp createdAt,
  }) = _Party;

  factory Party.fromJson(Map<String, Object?> json) => _$PartyFromJson(json);
}
