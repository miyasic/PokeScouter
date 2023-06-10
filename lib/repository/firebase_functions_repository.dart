import 'package:cloud_functions/cloud_functions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/firebase_functions_provider.dart';
import '../util/logger.dart';

final firebaseFunctionsRepositoryProvider =
    Provider<FirebaseFunctionsRepository>((ref) {
  final functions = ref.read(firebaseFunctionsProvider);
  return FirebaseFunctionsRepository(functions);
});

class FirebaseFunctionsRepository {
  FirebaseFunctionsRepository(this._functions);
  final FirebaseFunctions _functions;

  Future<void> callHelloWorldFunction() async {
    try {
      final HttpsCallable callable =
          _functions.httpsCallable('fetchSimilarBattle');
      // final HttpsCallable callable = _functions.httpsCallable('helloWorld');

      final Map<String, dynamic> data = {
        'param1': 'value1',
        'param2': 'value2',
        // Add more parameters as needed
      };

      final results = await callable(data);

      if (results.data != null) {
        logger.d(results.data);
      } else {
        throw Exception('Function failed to load data');
      }
    } catch (e) {
      logger.d(e);
    }
  }
}
