import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/router/router.dart';
import 'package:flutter_application_3/presentation/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return MaterialApp.router(
      routerConfig: approuter,
      theme: theme.getTheme(),
    );
  }
}
