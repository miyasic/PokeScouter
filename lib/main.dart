import 'package:flutter/material.dart';
import 'package:flutter_template/repository/shared_preferences.dart';
import 'package:flutter_template/router.dart';
import 'package:flutter_template/scaffold_messenger.dart';
import 'package:flutter_template/theme.dart';
import 'package:flutter_template/util/pokemon_suggest.dart';
import 'package:flutter_template/util/provider_logger.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
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
        .overrideWithValue(await SharedPreferences.getInstance())
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
    return MaterialApp.router(
      scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
