// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_suggest_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BattleSuggestState {
  bool get loading => throw _privateConstructorUsedError;
  List<({Battle battle, int similarity})> get battles =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BattleSuggestStateCopyWith<BattleSuggestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BattleSuggestStateCopyWith<$Res> {
  factory $BattleSuggestStateCopyWith(
          BattleSuggestState value, $Res Function(BattleSuggestState) then) =
      _$BattleSuggestStateCopyWithImpl<$Res, BattleSuggestState>;
  @useResult
  $Res call({bool loading, List<({Battle battle, int similarity})> battles});
}

/// @nodoc
class _$BattleSuggestStateCopyWithImpl<$Res, $Val extends BattleSuggestState>
    implements $BattleSuggestStateCopyWith<$Res> {
  _$BattleSuggestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? battles = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      battles: null == battles
          ? _value.battles
          : battles // ignore: cast_nullable_to_non_nullable
              as List<({Battle battle, int similarity})>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BattleSuggestStateCopyWith<$Res>
    implements $BattleSuggestStateCopyWith<$Res> {
  factory _$$_BattleSuggestStateCopyWith(_$_BattleSuggestState value,
          $Res Function(_$_BattleSuggestState) then) =
      __$$_BattleSuggestStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, List<({Battle battle, int similarity})> battles});
}

/// @nodoc
class __$$_BattleSuggestStateCopyWithImpl<$Res>
    extends _$BattleSuggestStateCopyWithImpl<$Res, _$_BattleSuggestState>
    implements _$$_BattleSuggestStateCopyWith<$Res> {
  __$$_BattleSuggestStateCopyWithImpl(
      _$_BattleSuggestState _value, $Res Function(_$_BattleSuggestState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? battles = null,
  }) {
    return _then(_$_BattleSuggestState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      battles: null == battles
          ? _value._battles
          : battles // ignore: cast_nullable_to_non_nullable
              as List<({Battle battle, int similarity})>,
    ));
  }
}

/// @nodoc

class _$_BattleSuggestState implements _BattleSuggestState {
  const _$_BattleSuggestState(
      {this.loading = true,
      final List<({Battle battle, int similarity})> battles =
          const <BattleWithSimilarity>[]})
      : _battles = battles;

  @override
  @JsonKey()
  final bool loading;
  final List<({Battle battle, int similarity})> _battles;
  @override
  @JsonKey()
  List<({Battle battle, int similarity})> get battles {
    if (_battles is EqualUnmodifiableListView) return _battles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_battles);
  }

  @override
  String toString() {
    return 'BattleSuggestState(loading: $loading, battles: $battles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BattleSuggestState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._battles, _battles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loading, const DeepCollectionEquality().hash(_battles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BattleSuggestStateCopyWith<_$_BattleSuggestState> get copyWith =>
      __$$_BattleSuggestStateCopyWithImpl<_$_BattleSuggestState>(
          this, _$identity);
}

abstract class _BattleSuggestState implements BattleSuggestState {
  const factory _BattleSuggestState(
          {final bool loading,
          final List<({Battle battle, int similarity})> battles}) =
      _$_BattleSuggestState;

  @override
  bool get loading;
  @override
  List<({Battle battle, int similarity})> get battles;
  @override
  @JsonKey(ignore: true)
  _$$_BattleSuggestStateCopyWith<_$_BattleSuggestState> get copyWith =>
      throw _privateConstructorUsedError;
}
