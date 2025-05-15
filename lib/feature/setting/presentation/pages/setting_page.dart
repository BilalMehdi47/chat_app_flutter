import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../user/presentation/pages/sign_in.dart';
import '../../../user/presentation/riverpod/controller/auth_controller.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // grab your AuthController
    final authCtl = ref.read(authControllerProvider.notifier);

    return Scaffold(
      body: Center(
        child: TextButton.icon(
          icon: const Icon(Icons.logout),
          label: const Text("Log out"),
          onPressed: () {
            // clear token and reset providers
            authCtl.signOut();
            // navigate back to sign‐in, removing all previous routes
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => SignInPage()),
              (route) => false,
            );
          },
        ),
      ),
    );
  }
}
