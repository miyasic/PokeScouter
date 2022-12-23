// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Party _$$_PartyFromJson(Map<String, dynamic> json) => _$_Party(
      userId: json['userId'] as String,
      partyId: json['partyId'] as String,
      party: (json['party'] as List<dynamic>).map((e) => e as String).toList(),
      divisorList: (json['divisorList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      eachMemo: Map<String, String>.from(json['eachMemo'] as Map),
    );

Map<String, dynamic> _$$_PartyToJson(_$_Party instance) => <String, dynamic>{
      'userId': instance.userId,
      'partyId': instance.partyId,
      'party': instance.party,
      'divisorList': instance.divisorList,
      'eachMemo': instance.eachMemo,
    };
