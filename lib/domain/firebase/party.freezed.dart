// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'party.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Party _$PartyFromJson(Map<String, dynamic> json) {
  return _Party.fromJson(json);
}

/// @nodoc
mixin _$Party {
  String get userId => throw _privateConstructorUsedError;
  String get partyId => throw _privateConstructorUsedError;
  List<String> get party => throw _privateConstructorUsedError;
  List<String> get divisorList => throw _privateConstructorUsedError;
  Map<String, String> get eachMemo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartyCopyWith<Party> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartyCopyWith<$Res> {
  factory $PartyCopyWith(Party value, $Res Function(Party) then) =
      _$PartyCopyWithImpl<$Res, Party>;
  @useResult
  $Res call(
      {String userId,
      String partyId,
      List<String> party,
      List<String> divisorList,
      Map<String, String> eachMemo});
}

/// @nodoc
class _$PartyCopyWithImpl<$Res, $Val extends Party>
    implements $PartyCopyWith<$Res> {
  _$PartyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? partyId = null,
    Object? party = null,
    Object? divisorList = null,
    Object? eachMemo = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      partyId: null == partyId
          ? _value.partyId
          : partyId // ignore: cast_nullable_to_non_nullable
              as String,
      party: null == party
          ? _value.party
          : party // ignore: cast_nullable_to_non_nullable
              as List<String>,
      divisorList: null == divisorList
          ? _value.divisorList
          : divisorList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      eachMemo: null == eachMemo
          ? _value.eachMemo
          : eachMemo // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PartyCopyWith<$Res> implements $PartyCopyWith<$Res> {
  factory _$$_PartyCopyWith(_$_Party value, $Res Function(_$_Party) then) =
      __$$_PartyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String partyId,
      List<String> party,
      List<String> divisorList,
      Map<String, String> eachMemo});
}

/// @nodoc
class __$$_PartyCopyWithImpl<$Res> extends _$PartyCopyWithImpl<$Res, _$_Party>
    implements _$$_PartyCopyWith<$Res> {
  __$$_PartyCopyWithImpl(_$_Party _value, $Res Function(_$_Party) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? partyId = null,
    Object? party = null,
    Object? divisorList = null,
    Object? eachMemo = null,
  }) {
    return _then(_$_Party(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      partyId: null == partyId
          ? _value.partyId
          : partyId // ignore: cast_nullable_to_non_nullable
              as String,
      party: null == party
          ? _value._party
          : party // ignore: cast_nullable_to_non_nullable
              as List<String>,
      divisorList: null == divisorList
          ? _value._divisorList
          : divisorList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      eachMemo: null == eachMemo
          ? _value._eachMemo
          : eachMemo // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Party implements _Party {
  const _$_Party(
      {required this.userId,
      required this.partyId,
      required final List<String> party,
      required final List<String> divisorList,
      required final Map<String, String> eachMemo})
      : _party = party,
        _divisorList = divisorList,
        _eachMemo = eachMemo;

  factory _$_Party.fromJson(Map<String, dynamic> json) =>
      _$$_PartyFromJson(json);

  @override
  final String userId;
  @override
  final String partyId;
  final List<String> _party;
  @override
  List<String> get party {
    if (_party is EqualUnmodifiableListView) return _party;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_party);
  }

  final List<String> _divisorList;
  @override
  List<String> get divisorList {
    if (_divisorList is EqualUnmodifiableListView) return _divisorList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_divisorList);
  }

  final Map<String, String> _eachMemo;
  @override
  Map<String, String> get eachMemo {
    if (_eachMemo is EqualUnmodifiableMapView) return _eachMemo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_eachMemo);
  }

  @override
  String toString() {
    return 'Party(userId: $userId, partyId: $partyId, party: $party, divisorList: $divisorList, eachMemo: $eachMemo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Party &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.partyId, partyId) || other.partyId == partyId) &&
            const DeepCollectionEquality().equals(other._party, _party) &&
            const DeepCollectionEquality()
                .equals(other._divisorList, _divisorList) &&
            const DeepCollectionEquality().equals(other._eachMemo, _eachMemo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      partyId,
      const DeepCollectionEquality().hash(_party),
      const DeepCollectionEquality().hash(_divisorList),
      const DeepCollectionEquality().hash(_eachMemo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PartyCopyWith<_$_Party> get copyWith =>
      __$$_PartyCopyWithImpl<_$_Party>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PartyToJson(
      this,
    );
  }
}

abstract class _Party implements Party {
  const factory _Party(
      {required final String userId,
      required final String partyId,
      required final List<String> party,
      required final List<String> divisorList,
      required final Map<String, String> eachMemo}) = _$_Party;

  factory _Party.fromJson(Map<String, dynamic> json) = _$_Party.fromJson;

  @override
  String get userId;
  @override
  String get partyId;
  @override
  List<String> get party;
  @override
  List<String> get divisorList;
  @override
  Map<String, String> get eachMemo;
  @override
  @JsonKey(ignore: true)
  _$$_PartyCopyWith<_$_Party> get copyWith =>
      throw _privateConstructorUsedError;
}
