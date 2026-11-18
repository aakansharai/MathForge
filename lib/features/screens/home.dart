import 'package:flutter/material.dart';
import 'package:math/features/screens/setting.dart';
import 'package:math/features/screens/theme_screen.dart';
import 'package:math/features/vector_forge.dart/vector_forge.dart';
import '../../core/theme/app_theme.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final List stages = [
      {'title': 'VECTOR FORGE', 'screen': VectorForgeScreen()},
      // {'title': 'MATRIX FORGE', 'screen': null},
      // {'title': 'CALCULUS FORGE', 'screen': null},
      // {'title': 'GRAPH FORGE', 'screen': null},
    ];
    return ValueListenableBuilder<int>(
      valueListenable: AppThemeController.instance,
      builder: (context, themeIndex, _) {
        final colors = AppTheme.palettes[themeIndex];

        return Scaffold(
          backgroundColor: colors.background,
          body: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    "MATHFORGE",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                      color: colors.primary,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 16),

                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: stages.length,
                      itemBuilder: (context, index) {
                        final stage = stages[index];
                        return _buildHomeText(
                          context: context,
                          index: index,
                          title: stage['title'],
                          color: colors.primary,
                          textColor: colors.text,
                          backgroundColor: colors.primary.withAlpha(50),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => VectorForgeScreen(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ThemeScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: colors.border),
                            color: colors.primary.withOpacity(0.18),
                          ),
                          child: Text(
                            "THEME",
                            style: TextStyle(
                              fontSize: 18,
                              color: colors.text,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SettingsScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: colors.border),
                            color: colors.primary.withOpacity(0.18),
                          ),
                          child: Text(
                            "SETTING",
                            style: TextStyle(
                              fontSize: 18,
                              color: colors.text,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHomeText({
    required BuildContext context,
    required String title,
    required int index,
    required dynamic color,
    required dynamic textColor,
    required dynamic backgroundColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: color),
        ),
        child: Row(
          children: [
            Text(
              "0${index + 1}",
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: 15,
                letterSpacing: 1,
              ),
            ),
            const Spacer(),
            Icon(Icons.chevron_right, color: color),
          ],
        ),
      ),
    );
  }
}
