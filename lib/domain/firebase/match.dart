import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_template/util/json_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'match.freezed.dart';
part 'match.g.dart';

@freezed
class Match with _$Match {
  const factory Match({
    required String userId,
    required String matchId,
    String? partyId,
    required List<String> opponentParty,
    required List<String> divisorList,
    required List<String> order,
    required String memo,
    required Map<String, String> eachMemo,
    required String result,
    @TimestampConverter() required Timestamp createdAt,
  }) = _Match;

  factory Match.fromJson(Map<String, Object?> json) => _$MatchFromJson(json);
}


