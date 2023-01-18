import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

final versionProvider = Provider<PackageInfo>((_) =>
    throw throw UnimplementedError("アプリケーション起動時にmainでawaitして生成したインスタンスを使用する"));
