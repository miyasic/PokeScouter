import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final remoteConfigProvider = Provider<FirebaseRemoteConfig>((_) {
  throw throw UnimplementedError("アプリケーション起動時にmainでawaitして生成したインスタンスを使用する");
});

class FirebaseRemoteConfigService {
  Future<FirebaseRemoteConfig> initRemoteConfig() async {
    /// インスタンスの作成
    final remoteConfig = FirebaseRemoteConfig.instance;

    /// シングルトンオブジェクトの取得
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 5),
    ));

    /// 値をフェッチ
    await remoteConfig.fetchAndActivate();

    return remoteConfig;
  }
}
