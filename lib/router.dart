import 'package:flutter/material.dart';
import 'package:poke_scouter/constants/provider_name.dart';
import 'package:poke_scouter/presentation/Widget/tab.dart';
import 'package:poke_scouter/presentation/battle_memo/battle_memo.dart';
import 'package:poke_scouter/presentation/battle_start/battle_start_page.dart';
import 'package:poke_scouter/presentation/battle_suggest/battle_suggest_page.dart';
import 'package:poke_scouter/presentation/history/history_page.dart';
import 'package:poke_scouter/presentation/login/login_page.dart';
import 'package:poke_scouter/presentation/party_register/party_register_page.dart';
import 'package:poke_scouter/presentation/top/top_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constants/route_path.dart';
import 'presentation/next/next_page.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: kPagePathBattleStart,
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return ScaffoldWithNavBar(child: child);
          },
          routes: [
            GoRoute(
              name: kPageNameTop,
              path: kPagePathTop,
              builder: (BuildContext context, GoRouterState state) {
                return const TopPage();
              },
            ),
            GoRoute(
                name: kPageNameBattleStart,
                path: kPagePathBattleStart,
                builder: (BuildContext context, GoRouterState state) {
                  return const BattleStartPage();
                }),
            GoRoute(
                name: kPageNameHistory,
                path: kPagePathHistory,
                builder: (BuildContext context, GoRouterState state) {
                  return const HistoryPage();
                }),
            GoRoute(
              name: kPageNameNext,
              path: kPagePathNext,
              builder: (BuildContext context, GoRouterState state) {
                return const NextPage();
              },
            ),
          ]),
      GoRoute(
          name: kPageNameLogin,
          path: kPagePathLogin,
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          }),
      GoRoute(
          name: kPageNamePartyRegister,
          path: kPagePathPartyRegister,
          builder: (BuildContext context, GoRouterState state) {
            return const PartyRegisterPage();
          }),
      GoRoute(
          name: kPageNameBattleSuggest,
          path: kPagePathBattleSuggest,
          builder: (BuildContext context, GoRouterState state) {
            return const BattleSuggestPage();
          }),
      GoRoute(
          name: kPageNameBattleMemo,
          path: kPagePathBattleMemo,
          builder: (BuildContext context, GoRouterState state) {
            return const BattleMemoPage();
          }),
    ],
  );
}, name: kProviderNameRouter);
