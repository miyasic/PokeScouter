// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Battle _$$_BattleFromJson(Map<String, dynamic> json) => _$_Battle(
      userId: json['userId'] as String,
      battleId: json['battleId'] as String,
      partyId: json['partyId'] as String,
      opponentParty: (json['opponentParty'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      myParty:
          (json['myParty'] as List<dynamic>).map((e) => e as String).toList(),
      divisorList6: (json['divisorList6'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      divisorList5: (json['divisorList5'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      divisorList4: (json['divisorList4'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      divisorList3: (json['divisorList3'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      divisorList2: (json['divisorList2'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      divisorList1: (json['divisorList1'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      opponentOrder: (json['opponentOrder'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      myOrder: (json['myOrder'] as List<dynamic>).map((e) => e as int).toList(),
      memo: json['memo'] as String,
      eachMemo: Map<String, String>.from(json['eachMemo'] as Map),
      result: json['result'] as String,
      createdAt: json['createdAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : alwaysUseServerTimestampUnionTimestampConverter
              .fromJson(json['createdAt'] as Object),
    );

Map<String, dynamic> _$$_BattleToJson(_$_Battle instance) => <String, dynamic>{
      'userId': instance.userId,
      'battleId': instance.battleId,
      'partyId': instance.partyId,
      'opponentParty': instance.opponentParty,
      'myParty': instance.myParty,
      'divisorList6': instance.divisorList6,
      'divisorList5': instance.divisorList5,
      'divisorList4': instance.divisorList4,
      'divisorList3': instance.divisorList3,
      'divisorList2': instance.divisorList2,
      'divisorList1': instance.divisorList1,
      'opponentOrder': instance.opponentOrder,
      'myOrder': instance.myOrder,
      'memo': instance.memo,
      'eachMemo': instance.eachMemo,
      'result': instance.result,
      'createdAt': alwaysUseServerTimestampUnionTimestampConverter
          .toJson(instance.createdAt),
    };
