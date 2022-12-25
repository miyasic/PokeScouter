// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Party _$$_PartyFromJson(Map<String, dynamic> json) => _$_Party(
      userId: json['userId'] as String,
      partyId: json['partyId'] as String,
      name: json['name'] as String,
      partyNameList: (json['partyNameList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      divisorList: (json['divisorList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      memo: json['memo'] as String,
      eachMemo: Map<String, String>.from(json['eachMemo'] as Map),
      createdAt: json['createdAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : alwaysUseServerTimestampUnionTimestampConverter
              .fromJson(json['createdAt'] as Object),
    );

Map<String, dynamic> _$$_PartyToJson(_$_Party instance) => <String, dynamic>{
      'userId': instance.userId,
      'partyId': instance.partyId,
      'name': instance.name,
      'partyNameList': instance.partyNameList,
      'divisorList': instance.divisorList,
      'memo': instance.memo,
      'eachMemo': instance.eachMemo,
      'createdAt': alwaysUseServerTimestampUnionTimestampConverter
          .toJson(instance.createdAt),
    };
