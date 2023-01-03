import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/firebase/battle.dart';

part 'battle_suggest_state.freezed.dart';

@freezed
class BattleSuggestState with _$BattleSuggestState {
  const factory BattleSuggestState({
    @Default(true) bool loading,
    @Default(<Battle>[]) List<Battle> battles,
    QueryDocumentSnapshot<Battle>? lastReadQueryDocumentSnapshot,
  }) = _BattleSuggestState;
}
