import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _Party;

  factory Party.fromJson(Map<String, Object?> json) => _$PartyFromJson(json);
}
