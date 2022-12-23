import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


class _TimestampConverter implements JsonConverter<Timestamp, Timestamp> {
  const _TimestampConverter({this.alwaysUseServerTimestamp = false});

  final bool alwaysUseServerTimestamp;
  @override
  Timestamp fromJson(Timestamp timestamp) {
    return timestamp;
  }

  @override
  Object toJson(Object? date) => alwaysUseServerTimestamp ? date : FieldValue.serverTimestamp();
}

/// toJson（Firestore への書き込み）時に、常に FieldValue.serverTimestamp を使用する
/// TimeStamp の JsonConverter。
const alwaysUseServerTimestampTimestampConverter =
_TimestampConverter(alwaysUseServerTimestamp: true);

class _TimestampConverter
    implements JsonConverter<Timestamp, Object> {
  const _TimestampConverter({this.alwaysUseServerTimestamp = false});

  /// toJson（Firestore への書き込み）時に、常に FieldValue.serverTimestamp を使用するかどうか。
  final bool alwaysUseServerTimestamp;

  @override
  Timestamp fromJson(Object json) {
    final timestamp = json as Timestamp;
    return Timestamp.dateTime(timestamp.toDate());
  }

  @override
  Object toJson(UnionTimestamp unionTimestamp) => alwaysUseServerTimestamp
      ? FieldValue.serverTimestamp()
      : unionTimestamp.map(
    dateTime: (unionDateTime) =>
        Timestamp.fromDate(unionDateTime.dateTime),
    serverTimestamp: (_) => FieldValue.serverTimestamp(),
  );
}
