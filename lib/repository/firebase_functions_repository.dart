import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/firebase/battle.dart';
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

  Map<String, dynamic> safeMapCast(Map<Object?, Object?> data) {
    return data.map((key, value) => MapEntry(key as String, value));
  }

  Future<List<Battle>> callFetchSimilarBattle(
      List<List<String>> divisorListList) async {
    try {
      final HttpsCallable callable =
          _functions.httpsCallable('fetchSimilarBattle');
      // final HttpsCallable callable = _functions.httpsCallable('helloWorld');

      final divisorList = {
        "divisorList6": divisorListList[0],
        "divisorList5": divisorListList[1],
        "divisorList4": divisorListList[2],
        "divisorList3": divisorListList[3],
        "divisorList2": divisorListList[4],
        "divisorList1": divisorListList[5],
      };
      final Map<String, dynamic> data = {
        'divisorList': divisorList,
        // Add more parameters as needed
      };

      final results = await callable(data);

      if (results.data != null) {
        // 結果をパース
        final battles = results.data.map<Battle>((item) {
          // todo: ほんとはこの処理せずに、Functions側から適切に返したい。
          logger.d("similarity: ${item["similarity"]}");
          item["createdAt"] = Timestamp(
              item["createdAt"]["_seconds"], item["createdAt"]["_nanoseconds"]);
          return Battle.fromJson(safeMapCast(item as Map<Object?, Object?>));
        }).toList();
        return battles;
      } else {
        throw Exception('Function failed to load data');
      }
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }
}
