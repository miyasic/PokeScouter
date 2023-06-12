import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_scouter/environment_config.dart';

final admobId = Provider<String>((ref) {
  bool isProd = EnvironmentConfig().isProd;

  final String adUnitId = switch ((isProd)) {
    true => _getProdUnitId(),
    false => _getDevUnitId(),
  };

  return adUnitId;
});

String _getProdUnitId() {
  if (Platform.isAndroid) {
    return "ca-app-pub-6246635878467153/4710152920";
  } else if (Platform.isIOS) {
    return "ca-app-pub-6246635878467153/4586917894";
  } else {
    throw "不明のOSです。";
  }
}

String _getDevUnitId() {
  if (Platform.isAndroid) {
    return "ca-app-pub-3940256099942544/5224354917";
  } else if (Platform.isIOS) {
    return "ca-app-pub-3940256099942544/1712485313";
  } else {
    throw "不明のOSです。";
  }
}
