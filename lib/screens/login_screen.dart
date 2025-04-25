import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'AI Meeting Summarizer',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              authState.when(
                data: (user) {
                  if (user != null) {
                    Future.microtask(() {
                      Navigator.pushReplacementNamed(context, '/upload');
                    });
                  }
                  return ElevatedButton.icon(
                    onPressed: () =>
                        ref.read(authStateProvider.notifier).signInWithGoogle(),
                    icon: const Icon(Icons.login),
                    label: const Text('Sign in with Google'),
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (e, _) => Column(
                  children: [
                    Text('Error: $e',
                        style: const TextStyle(color: Colors.red)),
                    ElevatedButton.icon(
                      onPressed: () => ref
                          .read(authStateProvider.notifier)
                          .signInWithGoogle(),
                      icon: const Icon(Icons.login),
                      label: const Text('Try Again'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
