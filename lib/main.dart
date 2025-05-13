import 'package:edu_teens/consts/app_strings.dart';
import 'package:edu_teens/theme/app_theme.dart';
import 'package:edu_teens/router/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      routerConfig: AppRouter.router,
      builder:
          (context, child) =>
              Container(color: Theme.of(context).primaryColor, child: child),
    );
  }
}
