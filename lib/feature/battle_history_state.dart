import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/firebase/battle.dart';

part 'battle_history_state.freezed.dart';

@freezed
class BattleHistoryState with _$BattleHistoryState {
  const factory BattleHistoryState({
    @Default(<Battle>[]) List<Battle> battles,
    QueryDocumentSnapshot<Battle>? lastReadQueryDocumentSnapshot,
  }) = _BattleHistoryState;
}
