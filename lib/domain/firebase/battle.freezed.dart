// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Battle _$BattleFromJson(Map<String, dynamic> json) {
  return _Battle.fromJson(json);
}

/// @nodoc
mixin _$Battle {
  String get userId => throw _privateConstructorUsedError;
  String get battleId => throw _privateConstructorUsedError;
  String? get partyId => throw _privateConstructorUsedError;
  List<String> get opponentParty => throw _privateConstructorUsedError;
  List<String> get divisorList6 => throw _privateConstructorUsedError;
  List<String> get divisorList5 => throw _privateConstructorUsedError;
  List<String> get divisorList4 => throw _privateConstructorUsedError;
  List<String> get divisorList3 => throw _privateConstructorUsedError;
  List<String> get divisorList2 => throw _privateConstructorUsedError;
  List<String> get divisorList1 => throw _privateConstructorUsedError;
  List<int> get opponentOrder => throw _privateConstructorUsedError;
  List<int> get myOrder => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  Map<String, String> get eachMemo => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BattleCopyWith<Battle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BattleCopyWith<$Res> {
  factory $BattleCopyWith(Battle value, $Res Function(Battle) then) =
      _$BattleCopyWithImpl<$Res, Battle>;
  @useResult
  $Res call(
      {String userId,
      String battleId,
      String? partyId,
      List<String> opponentParty,
      List<String> divisorList6,
      List<String> divisorList5,
      List<String> divisorList4,
      List<String> divisorList3,
      List<String> divisorList2,
      List<String> divisorList1,
      List<int> opponentOrder,
      List<int> myOrder,
      String memo,
      Map<String, String> eachMemo,
      String result,
      @alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp createdAt});

  $UnionTimestampCopyWith<$Res> get createdAt;
}

/// @nodoc
class _$BattleCopyWithImpl<$Res, $Val extends Battle>
    implements $BattleCopyWith<$Res> {
  _$BattleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? battleId = null,
    Object? partyId = freezed,
    Object? opponentParty = null,
    Object? divisorList6 = null,
    Object? divisorList5 = null,
    Object? divisorList4 = null,
    Object? divisorList3 = null,
    Object? divisorList2 = null,
    Object? divisorList1 = null,
    Object? opponentOrder = null,
    Object? myOrder = null,
    Object? memo = null,
    Object? eachMemo = null,
    Object? result = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      battleId: null == battleId
          ? _value.battleId
          : battleId // ignore: cast_nullable_to_non_nullable
              as String,
      partyId: freezed == partyId
          ? _value.partyId
          : partyId // ignore: cast_nullable_to_non_nullable
              as String?,
      opponentParty: null == opponentParty
          ? _value.opponentParty
          : opponentParty // ignore: cast_nullable_to_non_nullable
              as List<String>,
      divisorList6: null == divisorList6
          ? _value.divisorList6
          : divisorList6 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      divisorList5: null == divisorList5
          ? _value.divisorList5
          : divisorList5 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      divisorList4: null == divisorList4
          ? _value.divisorList4
          : divisorList4 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      divisorList3: null == divisorList3
          ? _value.divisorList3
          : divisorList3 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      divisorList2: null == divisorList2
          ? _value.divisorList2
          : divisorList2 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      divisorList1: null == divisorList1
          ? _value.divisorList1
          : divisorList1 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      opponentOrder: null == opponentOrder
          ? _value.opponentOrder
          : opponentOrder // ignore: cast_nullable_to_non_nullable
              as List<int>,
      myOrder: null == myOrder
          ? _value.myOrder
          : myOrder // ignore: cast_nullable_to_non_nullable
              as List<int>,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      eachMemo: null == eachMemo
          ? _value.eachMemo
          : eachMemo // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UnionTimestampCopyWith<$Res> get createdAt {
    return $UnionTimestampCopyWith<$Res>(_value.createdAt, (value) {
      return _then(_value.copyWith(createdAt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BattleCopyWith<$Res> implements $BattleCopyWith<$Res> {
  factory _$$_BattleCopyWith(_$_Battle value, $Res Function(_$_Battle) then) =
      __$$_BattleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String battleId,
      String? partyId,
      List<String> opponentParty,
      List<String> divisorList6,
      List<String> divisorList5,
      List<String> divisorList4,
      List<String> divisorList3,
      List<String> divisorList2,
      List<String> divisorList1,
      List<int> opponentOrder,
      List<int> myOrder,
      String memo,
      Map<String, String> eachMemo,
      String result,
      @alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp createdAt});

  @override
  $UnionTimestampCopyWith<$Res> get createdAt;
}

/// @nodoc
class __$$_BattleCopyWithImpl<$Res>
    extends _$BattleCopyWithImpl<$Res, _$_Battle>
    implements _$$_BattleCopyWith<$Res> {
  __$$_BattleCopyWithImpl(_$_Battle _value, $Res Function(_$_Battle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? battleId = null,
    Object? partyId = freezed,
    Object? opponentParty = null,
    Object? divisorList6 = null,
    Object? divisorList5 = null,
    Object? divisorList4 = null,
    Object? divisorList3 = null,
    Object? divisorList2 = null,
    Object? divisorList1 = null,
    Object? opponentOrder = null,
    Object? myOrder = null,
    Object? memo = null,
    Object? eachMemo = null,
    Object? result = null,
    Object? createdAt = null,
  }) {
    return _then(_$_Battle(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      battleId: null == battleId
          ? _value.battleId
          : battleId // ignore: cast_nullable_to_non_nullable
              as String,
      partyId: freezed == partyId
          ? _value.partyId
          : partyId // ignore: cast_nullable_to_non_nullable
              as String?,
      opponentParty: null == opponentParty
          ? _value._opponentParty
          : opponentParty // ignore: cast_nullable_to_non_nullable
              as List<String>,
      divisorList6: null == divisorList6
          ? _value._divisorList6
          : divisorList6 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      divisorList5: null == divisorList5
          ? _value._divisorList5
          : divisorList5 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      divisorList4: null == divisorList4
          ? _value._divisorList4
          : divisorList4 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      divisorList3: null == divisorList3
          ? _value._divisorList3
          : divisorList3 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      divisorList2: null == divisorList2
          ? _value._divisorList2
          : divisorList2 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      divisorList1: null == divisorList1
          ? _value._divisorList1
          : divisorList1 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      opponentOrder: null == opponentOrder
          ? _value._opponentOrder
          : opponentOrder // ignore: cast_nullable_to_non_nullable
              as List<int>,
      myOrder: null == myOrder
          ? _value._myOrder
          : myOrder // ignore: cast_nullable_to_non_nullable
              as List<int>,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      eachMemo: null == eachMemo
          ? _value._eachMemo
          : eachMemo // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Battle with DiagnosticableTreeMixin implements _Battle {
  const _$_Battle(
      {required this.userId,
      required this.battleId,
      this.partyId,
      required final List<String> opponentParty,
      required final List<String> divisorList6,
      required final List<String> divisorList5,
      required final List<String> divisorList4,
      required final List<String> divisorList3,
      required final List<String> divisorList2,
      required final List<String> divisorList1,
      required final List<int> opponentOrder,
      required final List<int> myOrder,
      required this.memo,
      required final Map<String, String> eachMemo,
      required this.result,
      @alwaysUseServerTimestampUnionTimestampConverter
          this.createdAt = const UnionTimestamp.serverTimestamp()})
      : _opponentParty = opponentParty,
        _divisorList6 = divisorList6,
        _divisorList5 = divisorList5,
        _divisorList4 = divisorList4,
        _divisorList3 = divisorList3,
        _divisorList2 = divisorList2,
        _divisorList1 = divisorList1,
        _opponentOrder = opponentOrder,
        _myOrder = myOrder,
        _eachMemo = eachMemo;

  factory _$_Battle.fromJson(Map<String, dynamic> json) =>
      _$$_BattleFromJson(json);

  @override
  final String userId;
  @override
  final String battleId;
  @override
  final String? partyId;
  final List<String> _opponentParty;
  @override
  List<String> get opponentParty {
    if (_opponentParty is EqualUnmodifiableListView) return _opponentParty;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_opponentParty);
  }

  final List<String> _divisorList6;
  @override
  List<String> get divisorList6 {
    if (_divisorList6 is EqualUnmodifiableListView) return _divisorList6;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_divisorList6);
  }

  final List<String> _divisorList5;
  @override
  List<String> get divisorList5 {
    if (_divisorList5 is EqualUnmodifiableListView) return _divisorList5;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_divisorList5);
  }

  final List<String> _divisorList4;
  @override
  List<String> get divisorList4 {
    if (_divisorList4 is EqualUnmodifiableListView) return _divisorList4;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_divisorList4);
  }

  final List<String> _divisorList3;
  @override
  List<String> get divisorList3 {
    if (_divisorList3 is EqualUnmodifiableListView) return _divisorList3;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_divisorList3);
  }

  final List<String> _divisorList2;
  @override
  List<String> get divisorList2 {
    if (_divisorList2 is EqualUnmodifiableListView) return _divisorList2;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_divisorList2);
  }

  final List<String> _divisorList1;
  @override
  List<String> get divisorList1 {
    if (_divisorList1 is EqualUnmodifiableListView) return _divisorList1;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_divisorList1);
  }

  final List<int> _opponentOrder;
  @override
  List<int> get opponentOrder {
    if (_opponentOrder is EqualUnmodifiableListView) return _opponentOrder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_opponentOrder);
  }

  final List<int> _myOrder;
  @override
  List<int> get myOrder {
    if (_myOrder is EqualUnmodifiableListView) return _myOrder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myOrder);
  }

  @override
  final String memo;
  final Map<String, String> _eachMemo;
  @override
  Map<String, String> get eachMemo {
    if (_eachMemo is EqualUnmodifiableMapView) return _eachMemo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_eachMemo);
  }

  @override
  final String result;
  @override
  @JsonKey()
  @alwaysUseServerTimestampUnionTimestampConverter
  final UnionTimestamp createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Battle(userId: $userId, battleId: $battleId, partyId: $partyId, opponentParty: $opponentParty, divisorList6: $divisorList6, divisorList5: $divisorList5, divisorList4: $divisorList4, divisorList3: $divisorList3, divisorList2: $divisorList2, divisorList1: $divisorList1, opponentOrder: $opponentOrder, myOrder: $myOrder, memo: $memo, eachMemo: $eachMemo, result: $result, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Battle'))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('battleId', battleId))
      ..add(DiagnosticsProperty('partyId', partyId))
      ..add(DiagnosticsProperty('opponentParty', opponentParty))
      ..add(DiagnosticsProperty('divisorList6', divisorList6))
      ..add(DiagnosticsProperty('divisorList5', divisorList5))
      ..add(DiagnosticsProperty('divisorList4', divisorList4))
      ..add(DiagnosticsProperty('divisorList3', divisorList3))
      ..add(DiagnosticsProperty('divisorList2', divisorList2))
      ..add(DiagnosticsProperty('divisorList1', divisorList1))
      ..add(DiagnosticsProperty('opponentOrder', opponentOrder))
      ..add(DiagnosticsProperty('myOrder', myOrder))
      ..add(DiagnosticsProperty('memo', memo))
      ..add(DiagnosticsProperty('eachMemo', eachMemo))
      ..add(DiagnosticsProperty('result', result))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Battle &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.battleId, battleId) ||
                other.battleId == battleId) &&
            (identical(other.partyId, partyId) || other.partyId == partyId) &&
            const DeepCollectionEquality()
                .equals(other._opponentParty, _opponentParty) &&
            const DeepCollectionEquality()
                .equals(other._divisorList6, _divisorList6) &&
            const DeepCollectionEquality()
                .equals(other._divisorList5, _divisorList5) &&
            const DeepCollectionEquality()
                .equals(other._divisorList4, _divisorList4) &&
            const DeepCollectionEquality()
                .equals(other._divisorList3, _divisorList3) &&
            const DeepCollectionEquality()
                .equals(other._divisorList2, _divisorList2) &&
            const DeepCollectionEquality()
                .equals(other._divisorList1, _divisorList1) &&
            const DeepCollectionEquality()
                .equals(other._opponentOrder, _opponentOrder) &&
            const DeepCollectionEquality().equals(other._myOrder, _myOrder) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            const DeepCollectionEquality().equals(other._eachMemo, _eachMemo) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      battleId,
      partyId,
      const DeepCollectionEquality().hash(_opponentParty),
      const DeepCollectionEquality().hash(_divisorList6),
      const DeepCollectionEquality().hash(_divisorList5),
      const DeepCollectionEquality().hash(_divisorList4),
      const DeepCollectionEquality().hash(_divisorList3),
      const DeepCollectionEquality().hash(_divisorList2),
      const DeepCollectionEquality().hash(_divisorList1),
      const DeepCollectionEquality().hash(_opponentOrder),
      const DeepCollectionEquality().hash(_myOrder),
      memo,
      const DeepCollectionEquality().hash(_eachMemo),
      result,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BattleCopyWith<_$_Battle> get copyWith =>
      __$$_BattleCopyWithImpl<_$_Battle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BattleToJson(
      this,
    );
  }
}

abstract class _Battle implements Battle {
  const factory _Battle(
      {required final String userId,
      required final String battleId,
      final String? partyId,
      required final List<String> opponentParty,
      required final List<String> divisorList6,
      required final List<String> divisorList5,
      required final List<String> divisorList4,
      required final List<String> divisorList3,
      required final List<String> divisorList2,
      required final List<String> divisorList1,
      required final List<int> opponentOrder,
      required final List<int> myOrder,
      required final String memo,
      required final Map<String, String> eachMemo,
      required final String result,
      @alwaysUseServerTimestampUnionTimestampConverter
          final UnionTimestamp createdAt}) = _$_Battle;

  factory _Battle.fromJson(Map<String, dynamic> json) = _$_Battle.fromJson;

  @override
  String get userId;
  @override
  String get battleId;
  @override
  String? get partyId;
  @override
  List<String> get opponentParty;
  @override
  List<String> get divisorList6;
  @override
  List<String> get divisorList5;
  @override
  List<String> get divisorList4;
  @override
  List<String> get divisorList3;
  @override
  List<String> get divisorList2;
  @override
  List<String> get divisorList1;
  @override
  List<int> get opponentOrder;
  @override
  List<int> get myOrder;
  @override
  String get memo;
  @override
  Map<String, String> get eachMemo;
  @override
  String get result;
  @override
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_BattleCopyWith<_$_Battle> get copyWith =>
      throw _privateConstructorUsedError;
}
