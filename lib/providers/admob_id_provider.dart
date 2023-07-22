import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final admobId = Provider<String>((ref) {
  final String adUnitId = _getAdmobUnitId();
  return adUnitId;
});

String _getAdmobUnitId() {
  if (Platform.isAndroid) {
    return const String.fromEnvironment('admobIdAndroid');
  } else if (Platform.isIOS) {
    return const String.fromEnvironment('admobIdIos');
  } else {
    throw "不明のOSです。";
  }
}
