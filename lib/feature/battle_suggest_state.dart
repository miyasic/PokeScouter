import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_template/constants/firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/firebase/battle.dart';

part 'battle_suggest_state.freezed.dart';

@freezed
class BattleSuggestState with _$BattleSuggestState {
  const factory BattleSuggestState({
    @Default(true) bool loading,
    @Default(<Battle>[]) List<Battle> battles,
    @Default(BattleSuggestStatus.sixSame) BattleSuggestStatus sameStatus,
    QueryDocumentSnapshot<Battle>? lastReadQueryDocumentSnapshot,
  }) = _BattleSuggestState;
}

enum BattleSuggestStatus {
  sixSame,
  fiveSame,
  fourSame,
  threeSame,
  twoSame,
  oneSame;

  int getIndex() {
    switch (this) {
      case BattleSuggestStatus.sixSame:
        return 0;
      case BattleSuggestStatus.fiveSame:
        return 1;
      case BattleSuggestStatus.fourSame:
        return 2;
      case BattleSuggestStatus.threeSame:
        return 3;
      case BattleSuggestStatus.twoSame:
        return 4;
      case BattleSuggestStatus.oneSame:
        return 5;
    }
  }

  BattleSuggestStatus getNext() {
    switch (this) {
      case BattleSuggestStatus.sixSame:
        return BattleSuggestStatus.fiveSame;
      case BattleSuggestStatus.fiveSame:
        return BattleSuggestStatus.fourSame;
      case BattleSuggestStatus.fourSame:
        return BattleSuggestStatus.threeSame;
      case BattleSuggestStatus.threeSame:
        return BattleSuggestStatus.threeSame;
      case BattleSuggestStatus.twoSame:
        return BattleSuggestStatus.threeSame;
      case BattleSuggestStatus.oneSame:
        return BattleSuggestStatus.threeSame;
    }
  }

  String getQueryField() {
    switch (this) {
      case BattleSuggestStatus.sixSame:
        return kFieldDivisorList6;
      case BattleSuggestStatus.fiveSame:
        return kFieldDivisorList5;
      case BattleSuggestStatus.fourSame:
        return kFieldDivisorList4;
      case BattleSuggestStatus.threeSame:
        return kFieldDivisorList3;
      case BattleSuggestStatus.twoSame:
        return kFieldDivisorList2;
      case BattleSuggestStatus.oneSame:
        return kFieldDivisorList1;
    }
  }
}
