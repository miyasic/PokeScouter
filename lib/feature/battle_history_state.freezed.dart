// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BattleHistoryState {
  List<Battle> get battles => throw _privateConstructorUsedError;
  QueryDocumentSnapshot<Battle>? get lastReadQueryDocumentSnapshot =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BattleHistoryStateCopyWith<BattleHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BattleHistoryStateCopyWith<$Res> {
  factory $BattleHistoryStateCopyWith(
          BattleHistoryState value, $Res Function(BattleHistoryState) then) =
      _$BattleHistoryStateCopyWithImpl<$Res, BattleHistoryState>;
  @useResult
  $Res call(
      {List<Battle> battles,
      QueryDocumentSnapshot<Battle>? lastReadQueryDocumentSnapshot});
}

/// @nodoc
class _$BattleHistoryStateCopyWithImpl<$Res, $Val extends BattleHistoryState>
    implements $BattleHistoryStateCopyWith<$Res> {
  _$BattleHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? battles = null,
    Object? lastReadQueryDocumentSnapshot = freezed,
  }) {
    return _then(_value.copyWith(
      battles: null == battles
          ? _value.battles
          : battles // ignore: cast_nullable_to_non_nullable
              as List<Battle>,
      lastReadQueryDocumentSnapshot: freezed == lastReadQueryDocumentSnapshot
          ? _value.lastReadQueryDocumentSnapshot
          : lastReadQueryDocumentSnapshot // ignore: cast_nullable_to_non_nullable
              as QueryDocumentSnapshot<Battle>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BattleHistoryStateCopyWith<$Res>
    implements $BattleHistoryStateCopyWith<$Res> {
  factory _$$_BattleHistoryStateCopyWith(_$_BattleHistoryState value,
          $Res Function(_$_BattleHistoryState) then) =
      __$$_BattleHistoryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Battle> battles,
      QueryDocumentSnapshot<Battle>? lastReadQueryDocumentSnapshot});
}

/// @nodoc
class __$$_BattleHistoryStateCopyWithImpl<$Res>
    extends _$BattleHistoryStateCopyWithImpl<$Res, _$_BattleHistoryState>
    implements _$$_BattleHistoryStateCopyWith<$Res> {
  __$$_BattleHistoryStateCopyWithImpl(
      _$_BattleHistoryState _value, $Res Function(_$_BattleHistoryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? battles = null,
    Object? lastReadQueryDocumentSnapshot = freezed,
  }) {
    return _then(_$_BattleHistoryState(
      battles: null == battles
          ? _value._battles
          : battles // ignore: cast_nullable_to_non_nullable
              as List<Battle>,
      lastReadQueryDocumentSnapshot: freezed == lastReadQueryDocumentSnapshot
          ? _value.lastReadQueryDocumentSnapshot
          : lastReadQueryDocumentSnapshot // ignore: cast_nullable_to_non_nullable
              as QueryDocumentSnapshot<Battle>?,
    ));
  }
}

/// @nodoc

class _$_BattleHistoryState implements _BattleHistoryState {
  const _$_BattleHistoryState(
      {final List<Battle> battles = const <Battle>[],
      this.lastReadQueryDocumentSnapshot})
      : _battles = battles;

  final List<Battle> _battles;
  @override
  @JsonKey()
  List<Battle> get battles {
    if (_battles is EqualUnmodifiableListView) return _battles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_battles);
  }

  @override
  final QueryDocumentSnapshot<Battle>? lastReadQueryDocumentSnapshot;

  @override
  String toString() {
    return 'BattleHistoryState(battles: $battles, lastReadQueryDocumentSnapshot: $lastReadQueryDocumentSnapshot)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BattleHistoryState &&
            const DeepCollectionEquality().equals(other._battles, _battles) &&
            (identical(other.lastReadQueryDocumentSnapshot,
                    lastReadQueryDocumentSnapshot) ||
                other.lastReadQueryDocumentSnapshot ==
                    lastReadQueryDocumentSnapshot));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_battles),
      lastReadQueryDocumentSnapshot);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BattleHistoryStateCopyWith<_$_BattleHistoryState> get copyWith =>
      __$$_BattleHistoryStateCopyWithImpl<_$_BattleHistoryState>(
          this, _$identity);
}

abstract class _BattleHistoryState implements BattleHistoryState {
  const factory _BattleHistoryState(
          {final List<Battle> battles,
          final QueryDocumentSnapshot<Battle>? lastReadQueryDocumentSnapshot}) =
      _$_BattleHistoryState;

  @override
  List<Battle> get battles;
  @override
  QueryDocumentSnapshot<Battle>? get lastReadQueryDocumentSnapshot;
  @override
  @JsonKey(ignore: true)
  _$$_BattleHistoryStateCopyWith<_$_BattleHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}
