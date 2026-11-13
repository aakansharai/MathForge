import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class SettingsBottomNavigation extends StatelessWidget {
  final AppColors colors;
  final VoidCallback onThemesTap;
  final VoidCallback onSettingsTap;

  const SettingsBottomNavigation({
    super.key,
    required this.colors,
    required this.onThemesTap,
    required this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 10, 28, 16),
      child: Row(
        children: [
          Expanded(
            child: _NavButton(
              label: 'THEMES',
              active: false,
              colors: colors,
              onTap: onThemesTap,
            ),
          ),
          const SizedBox(width: 22),
          Expanded(
            child: _NavButton(
              label: 'SETTINGS',
              active: true,
              colors: colors,
              onTap: onSettingsTap,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final bool active;
  final AppColors colors;
  final VoidCallback onTap;

  const _NavButton({
    required this.label,
    required this.active,
    required this.colors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active ? colors.card : Colors.transparent,
          border: Border.all(
            color: active ? colors.primary : colors.border.withOpacity(.5),
            width: active ? 2 : 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: active ? colors.primary : Colors.white54,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
