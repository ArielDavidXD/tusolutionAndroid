import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/providers/theme_provider.dart';
import 'data/theme/app_theme.dart';
import 'views/main_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: TuSolutionApp(),
    ),
  );
}

class TuSolutionApp extends ConsumerWidget {
  const TuSolutionApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: 'Tu Solution',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: const MainScreen(),
    );
  }
}
