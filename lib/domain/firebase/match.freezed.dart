// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Match _$MatchFromJson(Map<String, dynamic> json) {
  return _Match.fromJson(json);
}

/// @nodoc
mixin _$Match {
  String get userId => throw _privateConstructorUsedError;
  String get matchId => throw _privateConstructorUsedError;
  String? get partyId => throw _privateConstructorUsedError;
  List<String> get opponentParty => throw _privateConstructorUsedError;
  List<String> get divisorList => throw _privateConstructorUsedError;
  List<String> get order => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  Map<String, String> get eachMemo => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchCopyWith<Match> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchCopyWith<$Res> {
  factory $MatchCopyWith(Match value, $Res Function(Match) then) =
      _$MatchCopyWithImpl<$Res, Match>;
  @useResult
  $Res call(
      {String userId,
      String matchId,
      String? partyId,
      List<String> opponentParty,
      List<String> divisorList,
      List<String> order,
      String memo,
      Map<String, String> eachMemo,
      String result,
      @TimestampConverter() Timestamp createdAt});
}

/// @nodoc
class _$MatchCopyWithImpl<$Res, $Val extends Match>
    implements $MatchCopyWith<$Res> {
  _$MatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? matchId = null,
    Object? partyId = freezed,
    Object? opponentParty = null,
    Object? divisorList = null,
    Object? order = null,
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
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      partyId: freezed == partyId
          ? _value.partyId
          : partyId // ignore: cast_nullable_to_non_nullable
              as String?,
      opponentParty: null == opponentParty
          ? _value.opponentParty
          : opponentParty // ignore: cast_nullable_to_non_nullable
              as List<String>,
      divisorList: null == divisorList
          ? _value.divisorList
          : divisorList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MatchCopyWith<$Res> implements $MatchCopyWith<$Res> {
  factory _$$_MatchCopyWith(_$_Match value, $Res Function(_$_Match) then) =
      __$$_MatchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String matchId,
      String? partyId,
      List<String> opponentParty,
      List<String> divisorList,
      List<String> order,
      String memo,
      Map<String, String> eachMemo,
      String result,
      @TimestampConverter() Timestamp createdAt});
}

/// @nodoc
class __$$_MatchCopyWithImpl<$Res> extends _$MatchCopyWithImpl<$Res, _$_Match>
    implements _$$_MatchCopyWith<$Res> {
  __$$_MatchCopyWithImpl(_$_Match _value, $Res Function(_$_Match) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? matchId = null,
    Object? partyId = freezed,
    Object? opponentParty = null,
    Object? divisorList = null,
    Object? order = null,
    Object? memo = null,
    Object? eachMemo = null,
    Object? result = null,
    Object? createdAt = null,
  }) {
    return _then(_$_Match(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as String,
      partyId: freezed == partyId
          ? _value.partyId
          : partyId // ignore: cast_nullable_to_non_nullable
              as String?,
      opponentParty: null == opponentParty
          ? _value._opponentParty
          : opponentParty // ignore: cast_nullable_to_non_nullable
              as List<String>,
      divisorList: null == divisorList
          ? _value._divisorList
          : divisorList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      order: null == order
          ? _value._order
          : order // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Match with DiagnosticableTreeMixin implements _Match {
  const _$_Match(
      {required this.userId,
      required this.matchId,
      this.partyId,
      required final List<String> opponentParty,
      required final List<String> divisorList,
      required final List<String> order,
      required this.memo,
      required final Map<String, String> eachMemo,
      required this.result,
      @TimestampConverter() required this.createdAt})
      : _opponentParty = opponentParty,
        _divisorList = divisorList,
        _order = order,
        _eachMemo = eachMemo;

  factory _$_Match.fromJson(Map<String, dynamic> json) =>
      _$$_MatchFromJson(json);

  @override
  final String userId;
  @override
  final String matchId;
  @override
  final String? partyId;
  final List<String> _opponentParty;
  @override
  List<String> get opponentParty {
    if (_opponentParty is EqualUnmodifiableListView) return _opponentParty;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_opponentParty);
  }

  final List<String> _divisorList;
  @override
  List<String> get divisorList {
    if (_divisorList is EqualUnmodifiableListView) return _divisorList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_divisorList);
  }

  final List<String> _order;
  @override
  List<String> get order {
    if (_order is EqualUnmodifiableListView) return _order;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_order);
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
  @TimestampConverter()
  final Timestamp createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Match(userId: $userId, matchId: $matchId, partyId: $partyId, opponentParty: $opponentParty, divisorList: $divisorList, order: $order, memo: $memo, eachMemo: $eachMemo, result: $result, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Match'))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('matchId', matchId))
      ..add(DiagnosticsProperty('partyId', partyId))
      ..add(DiagnosticsProperty('opponentParty', opponentParty))
      ..add(DiagnosticsProperty('divisorList', divisorList))
      ..add(DiagnosticsProperty('order', order))
      ..add(DiagnosticsProperty('memo', memo))
      ..add(DiagnosticsProperty('eachMemo', eachMemo))
      ..add(DiagnosticsProperty('result', result))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Match &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.matchId, matchId) || other.matchId == matchId) &&
            (identical(other.partyId, partyId) || other.partyId == partyId) &&
            const DeepCollectionEquality()
                .equals(other._opponentParty, _opponentParty) &&
            const DeepCollectionEquality()
                .equals(other._divisorList, _divisorList) &&
            const DeepCollectionEquality().equals(other._order, _order) &&
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
      matchId,
      partyId,
      const DeepCollectionEquality().hash(_opponentParty),
      const DeepCollectionEquality().hash(_divisorList),
      const DeepCollectionEquality().hash(_order),
      memo,
      const DeepCollectionEquality().hash(_eachMemo),
      result,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MatchCopyWith<_$_Match> get copyWith =>
      __$$_MatchCopyWithImpl<_$_Match>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MatchToJson(
      this,
    );
  }
}

abstract class _Match implements Match {
  const factory _Match(
      {required final String userId,
      required final String matchId,
      final String? partyId,
      required final List<String> opponentParty,
      required final List<String> divisorList,
      required final List<String> order,
      required final String memo,
      required final Map<String, String> eachMemo,
      required final String result,
      @TimestampConverter() required final Timestamp createdAt}) = _$_Match;

  factory _Match.fromJson(Map<String, dynamic> json) = _$_Match.fromJson;

  @override
  String get userId;
  @override
  String get matchId;
  @override
  String? get partyId;
  @override
  List<String> get opponentParty;
  @override
  List<String> get divisorList;
  @override
  List<String> get order;
  @override
  String get memo;
  @override
  Map<String, String> get eachMemo;
  @override
  String get result;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_MatchCopyWith<_$_Match> get copyWith =>
      throw _privateConstructorUsedError;
}
