import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/shared_preferences.dart';
import '../repository/shared_preferences.dart';

final showFirstTutorialProvider = StateProvider((ref) =>
    ref
        .read(sharedPreferencesProvider)
        .getBool(kSharedPrefsShowFirstTutorial) ??
    true);

final showBattleStartTutorialProvider = StateProvider((ref) =>
    ref
        .read(sharedPreferencesProvider)
        .getBool(kSharedPrefsShowBattleStartTutorial) ??
    true);
