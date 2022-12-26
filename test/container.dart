import 'package:flutter_template/repository/firestore/firebase.dart';
import 'package:flutter_template/util/pokemon_suggest.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'repository/firebase_mock.dart';

Future<ProviderContainer> overrideRepository() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final pokemonRawData = await getPokemonRawData;
  return ProviderContainer(overrides: [
    pokemonRawDataProvider.overrideWithValue(pokemonRawData),
    firebaseRepositoryProvider
        .overrideWith((ref) => ref.read(firebaseRepositoryMockProvider))
  ]);
}
