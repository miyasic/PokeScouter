import 'package:flutter_template/util/union_timestamp.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'battle.freezed.dart';
part 'battle.g.dart';

@freezed
class Battle with _$Battle {
  const factory Battle({
    required String userId,
    required String battleId,
    String? partyId,
    required List<String> opponentParty,
    required List<String> divisorList,
    required List<String> order,
    required String memo,
    required Map<String, String> eachMemo,
    required String result,
    @alwaysUseServerTimestampUnionTimestampConverter
    @Default(UnionTimestamp.serverTimestamp())
        UnionTimestamp createdAt,
  }) = _Battle;

  factory Battle.fromJson(Map<String, Object?> json) => _$BattleFromJson(json);
}
