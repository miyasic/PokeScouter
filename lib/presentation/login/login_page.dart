import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_template/constants/route_path.dart';
import 'package:flutter_template/presentation/login/user_state_provider.dart';
import 'package:flutter_template/providers/auth_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../top/top_page.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userStateProvider);
    final emailController = useTextEditingController();
    final passController = useTextEditingController();

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
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    labelText: 'メールアドレス',
                  ),
                ),
                const SizedBox(height: 24.0),
                TextField(
                  controller: passController, // Controller実装必要
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
                          .signIn(emailController.text, passController.text);
                    },
                    child: Text('ログイン')),
                ElevatedButton(
                    onPressed: () {
                      ref
                          .read(authControllerProvider.notifier)
                          .signUp(emailController.text, passController.text);
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
