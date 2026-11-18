import 'package:flutter/material.dart';
import 'package:math/core/theme/app_theme.dart';
import 'package:math/features/screens/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: AppThemeController.instance,
      builder: (context, themeIndex, _) {
        final currentTheme = AppTheme.palettes[themeIndex];
        return MaterialApp(
          title: 'Math',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: currentTheme.background,
            brightness: Brightness.dark,
          ),
          home: const Splash(),
        );
      },
    );
  }
}
