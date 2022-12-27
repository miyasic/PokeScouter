import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final admobId = Provider<String>((ref) {
  late final String adUnitId;
  bool isProd = false;
  if (isProd) {
    throw UnimplementedError();
  } else {
    if (Platform.isAndroid) {
      adUnitId = "	ca-app-pub-3940256099942544/5224354917";
    } else if (Platform.isIOS) {
      adUnitId = "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw "不明のOSです。";
    }
  }
  return adUnitId;
});
