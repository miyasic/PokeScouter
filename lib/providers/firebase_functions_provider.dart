import 'package:cloud_functions/cloud_functions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_scouter/constants/firebase_environment.dart';

import '../environment_config.dart';

final firebaseFunctionsProvider = Provider<FirebaseFunctions>((ref) {
  final env = EnvironmentConfig().environment;
  FirebaseFunctions functions =
      FirebaseFunctions.instanceFor(region: defaultRegion);
  if (env == Environment.emulator) {
    functions.useFunctionsEmulator(localhost, portForFirebaseFunctionsEmulator);
  }

  return functions;
});
