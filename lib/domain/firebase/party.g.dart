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
      'divisorList6': instance.divisorList6,
      'divisorList5': instance.divisorList5,
      'divisorList4': instance.divisorList4,
      'divisorList3': instance.divisorList3,
      'divisorList2': instance.divisorList2,
      'divisorList1': instance.divisorList1,
      'memo': instance.memo,
      'eachMemo': instance.eachMemo,
      'createdAt': alwaysUseServerTimestampUnionTimestampConverter
          .toJson(instance.createdAt),
    };
