// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Battle _$$_BattleFromJson(Map<String, dynamic> json) => _$_Battle(
      userId: json['userId'] as String,
      battleId: json['battleId'] as String,
      partyId: json['partyId'] as String?,
      opponentParty: (json['opponentParty'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      divisorList: (json['divisorList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      order: (json['order'] as List<dynamic>).map((e) => e as String).toList(),
      memo: json['memo'] as String,
      eachMemo: Map<String, String>.from(json['eachMemo'] as Map),
      result: json['result'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$_BattleToJson(_$_Battle instance) => <String, dynamic>{
      'userId': instance.userId,
      'battleId': instance.battleId,
      'partyId': instance.partyId,
      'opponentParty': instance.opponentParty,
      'divisorList': instance.divisorList,
      'order': instance.order,
      'memo': instance.memo,
      'eachMemo': instance.eachMemo,
      'result': instance.result,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
