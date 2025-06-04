import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../user/presentation/pages/sign_in.dart';
import '../../../user/presentation/riverpod/controller/auth_controller.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      body: Center(
        child: authState.maybeWhen(
          orElse: () => TextButton.icon(
            icon: const Icon(Icons.logout),
            label: const Text("Log out"),
            onPressed: () async {
              final result = await ref.read(authControllerProvider.notifier).signOut();

              // Only proceed if the context is still valid
              if (!context.mounted) return;

              result.fold(
                (failure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(failure.message)),
                  );
                },
                (_) {
                  // Use pushAndRemoveUntil to clear the navigation stack
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => SignInPage()),
                    (route) => false,
                  );
                },
              );
            },
          ),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
