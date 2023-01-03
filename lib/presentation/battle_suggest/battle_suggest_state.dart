import 'package:flutter/cupertino.dart';
import 'package:flutter_template/repository/firestore/firebase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/firebase/battle.dart';
import '../../providers/auth_controller.dart';

final battleListProvider = StateNotifierProvider<BattleListState, List<Battle>>(
    (ref) => BattleListState(
        firebaseRepository: ref.read(firebaseRepositoryProvider),
        authController: ref.read(authControllerProvider.notifier)));

class BattleListState extends StateNotifier<List<Battle>> {
  BattleListState({
    required this.firebaseRepository,
    required this.authController,
  }) : super([]);

  final FirebaseRepository firebaseRepository;
  final AuthController authController;
  final ScrollController scrollController = ScrollController();

  // fetchBattle(
  //     {required List<String> divisorList,
  //     required Function showLoginDialog}) async {
  //   final user = authController.state;
  //   if (user == null) {
  //     await showLoginDialog();
  //     return;
  //   }
  //   final newBattle = await firebaseRepository.getBattle(user.uid, divisorList);
  //   state = [...state, ...newBattle];
  // }
}
