import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_scouter/constants/route_path.dart';
import 'package:poke_scouter/presentation/login/user_state_provider.dart';
import 'package:poke_scouter/providers/auth_controller.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userStateProvider);
    final emailController = useTextEditingController();
    final passController = useTextEditingController();

    return state.when(
      data: (data) {
        // ログイン済みの場合
        if (data != null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(kPageNameLogin),
            ),
            body: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('ログイン済みです。'),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ref.read(authControllerProvider.notifier).signOut();
                      },
                      child: const Text("ログアウト")),
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
                    obscureText: true,
                    obscuringCharacter: 'Θ',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      labelText: 'パスワード',
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                      onPressed: () async {
                        final navigator = Navigator.of(context);
                        await ref.read(authControllerProvider.notifier).signIn(
                            email: emailController.text,
                            password: passController.text,
                            onCompleted: () {
                              navigator.pop();
                            });
                      },
                      child: const Text('ログイン')),
                  ElevatedButton(
                      onPressed: () async {
                        final navigator = Navigator.of(context);
                        await ref.read(authControllerProvider.notifier).signUp(
                            email: emailController.text,
                            password: passController.text,
                            onCompleted: () {
                              navigator.pop();
                            });
                      },
                      child: const Text('新規登録')),
                ],
              )),
        );
      },
      error: (_, __) {
        return const Scaffold(
          body: Center(
            child: Text('エラーだよ'),
          ),
        );
      },
      loading: () {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
