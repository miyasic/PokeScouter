import 'package:flutter/material.dart';
import 'package:flutter_template/constants/provider_name.dart';
import 'package:flutter_template/presentation/top/top_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constants/route_path.dart';
import 'presentation/next/next_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: kPagePathTop,
    routes: [
      GoRoute(
        name: kPageNameTop,
        path: kPagePathTop,
        builder: (BuildContext context, GoRouterState state) {
          return const TopPage();
        },
      ),
      GoRoute(
        name: kPageNameNext,
        path: kPagePathNext,
        builder: (BuildContext context, GoRouterState state) {
          return const NextPage();
        },
      ),
    ],
  );
}, name: kProviderNameRouter);
