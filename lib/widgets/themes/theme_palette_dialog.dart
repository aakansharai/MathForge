import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme.dart';
import 'theme_palette_tile.dart';

class ThemePaletteDialog extends StatelessWidget {
  final AppColors colors;
  final int selectedIndex;
  final ValueChanged<int> onThemeSelected;

  const ThemePaletteDialog({
    super.key,
    required this.colors,
    required this.selectedIndex,
    required this.onThemeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: colors.panel,
          border: Border.all(color: colors.border, width: 2),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 18),
              Text(
                'THEME PALETTES',
                style: TextStyle(
                  color: colors.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 28),
              ...List.generate(AppTheme.palettes.length, (index) {
                final palette = AppTheme.palettes[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: ThemePaletteTile(
                    palette: palette,
                    isActive: selectedIndex == index,
                    onTap: () => onThemeSelected(index),
                  ),
                );
              }),
              const SizedBox(height: 12),
              SizedBox(
                width: 200,
                height: 62,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF742034),
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    side: BorderSide(color: colors.border),
                  ),
                  child: const Text(
                    'CLOSE',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
