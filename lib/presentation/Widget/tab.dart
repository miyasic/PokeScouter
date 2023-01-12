import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/route_path.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.balance),
            label: "対戦",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_sharp), label: "履歴"),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'マイページ',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(kPagePathBattleStart)) {
      return 0;
    }
    if (location.startsWith(kPagePathHistory0)) {
      return 1;
    }
    if (location.startsWith(kPagePathHistory1)) {
      return 1;
    }
    if (location.startsWith(kPagePathMy)) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(kPagePathBattleStart);
        break;
      case 1:
        context.go(kPagePathHistory0);
        break;
      case 2:
        context.go(kPagePathMy);
        break;
    }
  }
}
