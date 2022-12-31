import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((_) {
  throw throw UnimplementedError("アプリケーション起動時にmainでawaitして生成したインスタンスを使用する");
});
