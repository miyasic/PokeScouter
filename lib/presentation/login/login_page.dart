import 'package:flutter/material.dart';
import 'package:flutter_template/constants/route_path.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              ElevatedButton(onPressed: () {}, child: Text('ログイン')),
              ElevatedButton(onPressed: () {}, child: Text('新規登録')),
            ],
          )),
    );
  }
}
