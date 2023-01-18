import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_scouter/constants/route_path.dart';
import 'package:poke_scouter/presentation/Widget/show_dialog.dart';
import 'package:poke_scouter/presentation/login/user_state_provider.dart';
import 'package:poke_scouter/repository/auth_repository.dart';

import '../../constants/text_style.dart';
import '../../providers/auth_controller.dart';
import '../../providers/version_provider.dart';
import '../../theme.dart';
import '../Widget/my_page_widget.dart';

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userStateProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text(kPageNameMy),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            userState.when(
              data: (data) {
                // ログイン済みの場合
                if (data != null) {
                  return MyPageTile(
                      title: 'ログアウト',
                      icons: Icons.logout,
                      iconColor: Colors.grey,
                      onTap: () {
                        ref.read(authControllerProvider.notifier).signOut();
                      });
                }
                // 未ログインの場合
                return MyPageTile(
                    title: 'ログイン・新規会員登録',
                    icons: Icons.login,
                    iconColor: Colors.grey,
                    onTap: () {
                      context.push(kPagePathLogin);
                    });
              },
              error: (_, __) {
                return MyPageTile(
                    title: 'ログイン状態取得失敗',
                    icons: Icons.logout,
                    iconColor: Colors.red,
                    onTap: () {});
              },
              loading: () {
                return MyPageTile(
                    title: 'ログイン状態取得中',
                    icons: Icons.logout,
                    iconColor: Colors.grey,
                    onTap: () {});
              },
            ),
            MyPageTile(
                title: 'ダークモード',
                icons: ref.watch(themeModeProvider).getIcon(),
                iconColor: Colors.grey,
                trailing: const SizedBox(),
                onTap: () {
                  final state = ref.read(themeModeProvider.notifier).state;
                  ref.read(themeModeProvider.notifier).state = state.getNext();
                }),
            MyPageTile(
                title: 'パーティ登録',
                icons: Icons.add,
                iconColor: Colors.grey,
                onTap: () {
                  context.go(kPagePathFullPartyRegister);
                }),
            MyPageTile(
                title: 'アプリバージョン',
                icons: Icons.update,
                iconColor: Colors.grey,
                trailing: Text(ref.read(versionProvider).version),
                onTap: () {}),
            userState.when(
              data: (data) {
                if (data != null) {
                  // ログイン済みの場合
                  return MyPageTile(
                      title: '退会する',
                      style: textStyleGreyPlain,
                      icons: Icons.account_circle,
                      iconColor: Colors.grey,
                      trailing: const SizedBox(),
                      onTap: () {
                        showConfirmDialog(
                            context: context,
                            message: "退会するとデータの復元はできなくなります。",
                            title: "退会しますか？",
                            okText: "退会する。",
                            function: () async {
                              await ref
                                  .read(authRepositoryProvider)
                                  .deleteUser();
                            });
                      });
                }
                // 未ログインの場合
                return const SizedBox();
              },
              error: (_, __) {
                return const SizedBox();
              },
              loading: () {
                return const SizedBox();
              },
            ),
          ],
        ));
  }
}
