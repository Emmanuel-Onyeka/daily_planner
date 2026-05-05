import 'package:dialy_planner/router/router_config.dart';
import 'package:dialy_planner/shared/constants/app_constants.dart';
import 'package:dialy_planner/shared/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerConfig);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: router.config(),
    );
  }
}
