import 'package:flutter/material.dart';
import 'package:flutter_template/constants/route_path.dart';
import 'package:flutter_template/presentation/login/user_state_provider.dart';
import 'package:flutter_template/providers/auth_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../top/top_page.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userStateProvider);

    return state.when(data: (data) {
      // ログイン済みの場合
      if (data != null) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(kPageNameLogin),
          ),
          body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      final user =
                          ref.read(authControllerProvider.notifier).state;
                      print(user?.uid);
                    },
                    child: Text('ログイン済みです。')),
                ElevatedButton(
                    onPressed: () {
                      ref.read(authControllerProvider.notifier).signOut();
                    },
                    child: Text("ログアウト")),
              ],
            ),
          ),
        );
      }
      // 未ログインの場合
      return Scaffold(
        appBar: AppBar(
          title: const Text(kPageNameLogin),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    labelText: 'メールアドレス',
                  ),
                ),
                const SizedBox(height: 24.0),
                TextField(
                  controller: null, // Controller実装必要
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    labelText: 'パスワード',
                  ),
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                    onPressed: () {
                      ref
                          .read(authControllerProvider.notifier)
                          .signIn('kou.sepak@gmail.com', 'abcdef5');
                    },
                    child: Text('ログイン')),
                ElevatedButton(
                    onPressed: () {
                      ref
                          .read(authControllerProvider.notifier)
                          .signUp('kou.sepak@gmail.com', 'abcdef5');
                    },
                    child: Text('新規登録')),
              ],
            )),
      );
    }, error: (_, __) {
      return const Scaffold(
        body: Center(
          child: Text('エラーだよ'),
        ),
      );
    }, loading: () {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
