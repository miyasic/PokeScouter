import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/shared_preferences.dart';
import '../repository/shared_preferences.dart';

final showFirstTutorialProvider = StateProvider((ref) =>
    ref
        .read(sharedPreferencesProvider)
        .getBool(kSharedPrefsShowTutorialFirst) ??
    true);

final showBattleStartTutorialProvider = StateProvider((ref) =>
    ref
        .read(sharedPreferencesProvider)
        .getBool(kSharedPrefsShowTutorialBattleStart) ??
    true);

final showBattleSuggestTutorialProvider = StateProvider((ref) =>
    ref
        .read(sharedPreferencesProvider)
        .getBool(kSharedPrefsShowTutorialBattleSuggest) ??
    true);

final showBattleMemoTutorialProvider = StateProvider((ref) =>
    ref
        .read(sharedPreferencesProvider)
        .getBool(kSharedPrefsShowTutorialBattleMemo) ??
    true);
