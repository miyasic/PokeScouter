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
  String get name => throw _privateConstructorUsedError;
  List<String> get partyNameList => throw _privateConstructorUsedError;
  List<String> get divisorList6 => throw _privateConstructorUsedError;
  List<String> get divisorList5 => throw _privateConstructorUsedError;
  List<String> get divisorList4 => throw _privateConstructorUsedError;
  List<String> get divisorList3 => throw _privateConstructorUsedError;
  List<String> get divisorList2 => throw _privateConstructorUsedError;
  List<String> get divisorList1 => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  Map<String, String> get eachMemo => throw _privateConstructorUsedError;
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get createdAt => throw _privateConstructorUsedError;

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
      String name,
      List<String> partyNameList,
      List<String> divisorList6,
      List<String> divisorList5,
      List<String> divisorList4,
      List<String> divisorList3,
      List<String> divisorList2,
      List<String> divisorList1,
      String memo,
      Map<String, String> eachMemo,
      @alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp createdAt});

  $UnionTimestampCopyWith<$Res> get createdAt;
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
    Object? name = null,
    Object? partyNameList = null,
    Object? divisorList6 = null,
    Object? divisorList5 = null,
    Object? divisorList4 = null,
    Object? divisorList3 = null,
    Object? divisorList2 = null,
    Object? divisorList1 = null,
    Object? memo = null,
    Object? eachMemo = null,
    Object? createdAt = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      partyNameList: null == partyNameList
          ? _value.partyNameList
          : partyNameList // ignore: cast_nullable_to_non_nullable
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
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      eachMemo: null == eachMemo
          ? _value.eachMemo
          : eachMemo // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
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
abstract class _$$_PartyCopyWith<$Res> implements $PartyCopyWith<$Res> {
  factory _$$_PartyCopyWith(_$_Party value, $Res Function(_$_Party) then) =
      __$$_PartyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String partyId,
      String name,
      List<String> partyNameList,
      List<String> divisorList6,
      List<String> divisorList5,
      List<String> divisorList4,
      List<String> divisorList3,
      List<String> divisorList2,
      List<String> divisorList1,
      String memo,
      Map<String, String> eachMemo,
      @alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp createdAt});

  @override
  $UnionTimestampCopyWith<$Res> get createdAt;
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
    Object? name = null,
    Object? partyNameList = null,
    Object? divisorList6 = null,
    Object? divisorList5 = null,
    Object? divisorList4 = null,
    Object? divisorList3 = null,
    Object? divisorList2 = null,
    Object? divisorList1 = null,
    Object? memo = null,
    Object? eachMemo = null,
    Object? createdAt = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      partyNameList: null == partyNameList
          ? _value._partyNameList
          : partyNameList // ignore: cast_nullable_to_non_nullable
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
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      eachMemo: null == eachMemo
          ? _value._eachMemo
          : eachMemo // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Party implements _Party {
  const _$_Party(
      {required this.userId,
      required this.partyId,
      required this.name,
      required final List<String> partyNameList,
      required final List<String> divisorList6,
      required final List<String> divisorList5,
      required final List<String> divisorList4,
      required final List<String> divisorList3,
      required final List<String> divisorList2,
      required final List<String> divisorList1,
      required this.memo,
      required final Map<String, String> eachMemo,
      @alwaysUseServerTimestampUnionTimestampConverter
          this.createdAt = const UnionTimestamp.serverTimestamp()})
      : _partyNameList = partyNameList,
        _divisorList6 = divisorList6,
        _divisorList5 = divisorList5,
        _divisorList4 = divisorList4,
        _divisorList3 = divisorList3,
        _divisorList2 = divisorList2,
        _divisorList1 = divisorList1,
        _eachMemo = eachMemo;

  factory _$_Party.fromJson(Map<String, dynamic> json) =>
      _$$_PartyFromJson(json);

  @override
  final String userId;
  @override
  final String partyId;
  @override
  final String name;
  final List<String> _partyNameList;
  @override
  List<String> get partyNameList {
    if (_partyNameList is EqualUnmodifiableListView) return _partyNameList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_partyNameList);
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
  @JsonKey()
  @alwaysUseServerTimestampUnionTimestampConverter
  final UnionTimestamp createdAt;

  @override
  String toString() {
    return 'Party(userId: $userId, partyId: $partyId, name: $name, partyNameList: $partyNameList, divisorList6: $divisorList6, divisorList5: $divisorList5, divisorList4: $divisorList4, divisorList3: $divisorList3, divisorList2: $divisorList2, divisorList1: $divisorList1, memo: $memo, eachMemo: $eachMemo, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Party &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.partyId, partyId) || other.partyId == partyId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._partyNameList, _partyNameList) &&
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
            (identical(other.memo, memo) || other.memo == memo) &&
            const DeepCollectionEquality().equals(other._eachMemo, _eachMemo) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      partyId,
      name,
      const DeepCollectionEquality().hash(_partyNameList),
      const DeepCollectionEquality().hash(_divisorList6),
      const DeepCollectionEquality().hash(_divisorList5),
      const DeepCollectionEquality().hash(_divisorList4),
      const DeepCollectionEquality().hash(_divisorList3),
      const DeepCollectionEquality().hash(_divisorList2),
      const DeepCollectionEquality().hash(_divisorList1),
      memo,
      const DeepCollectionEquality().hash(_eachMemo),
      createdAt);

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
      required final String name,
      required final List<String> partyNameList,
      required final List<String> divisorList6,
      required final List<String> divisorList5,
      required final List<String> divisorList4,
      required final List<String> divisorList3,
      required final List<String> divisorList2,
      required final List<String> divisorList1,
      required final String memo,
      required final Map<String, String> eachMemo,
      @alwaysUseServerTimestampUnionTimestampConverter
          final UnionTimestamp createdAt}) = _$_Party;

  factory _Party.fromJson(Map<String, dynamic> json) = _$_Party.fromJson;

  @override
  String get userId;
  @override
  String get partyId;
  @override
  String get name;
  @override
  List<String> get partyNameList;
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
  String get memo;
  @override
  Map<String, String> get eachMemo;
  @override
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_PartyCopyWith<_$_Party> get copyWith =>
      throw _privateConstructorUsedError;
}
