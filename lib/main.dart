import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:poke_scouter/providers/remote_config_provider.dart';
import 'package:poke_scouter/providers/version_provider.dart';
import 'package:poke_scouter/repository/shared_preferences.dart';
import 'package:poke_scouter/router.dart';
import 'package:poke_scouter/scaffold_messenger.dart';
import 'package:poke_scouter/theme.dart';
import 'package:poke_scouter/util/pokemon_suggest.dart';
import 'package:poke_scouter/util/provider_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(overrides: <Override>[
    pokemonRawDataProvider.overrideWithValue(await getPokemonRawData),
    sharedPreferencesProvider
        .overrideWithValue(await SharedPreferences.getInstance()),
    remoteConfigProvider.overrideWithValue(
        await FirebaseRemoteConfigService().initRemoteConfig()),
    versionProvider.overrideWithValue(await PackageInfo.fromPlatform())
  ], observers: [
    ProviderLogger()
  ], child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final lightTheme = ref.watch(themeProvider(Brightness.light));
    final darkTheme = ref.watch(themeProvider(Brightness.dark));
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
    );
  }
}
