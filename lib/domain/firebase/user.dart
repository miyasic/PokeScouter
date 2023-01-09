import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poke_scouter/constants/firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  factory User.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return User.fromJson(<String, dynamic>{
      ...data,
      kFieldUserId: ds.id,
    });
  }
}
