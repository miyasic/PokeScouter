import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    required String name,
    required String number,
    required String primeNumber,
    required String h,
    required String a,
    required String b,
    required String c,
    required String d,
    required String s,
    required String sum,
    String? type1,
    String? type2,
    String? ability1,
    String? ability2,
    String? hiddenAbility,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, Object?> json) =>
      _$PokemonFromJson(json);
}
