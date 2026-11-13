import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class ThemePaletteTile extends StatelessWidget {
  final AppColors palette;
  final bool isActive;
  final VoidCallback onTap;

  const ThemePaletteTile({
    super.key,
    required this.palette,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 112,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: palette.primary.withOpacity(.08),
          border: Border.all(color: palette.border),
        ),
        child: Row(
          children: [
            Container(
              width: 54,
              height: 84,
              color: palette.primary,
              padding: const EdgeInsets.all(8),
              alignment: Alignment.topCenter,
              child: Container(
                width: 36,
                height: 55,
                color: palette.secondary,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                palette.name,
                style: TextStyle(
                  color: palette.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 105,
              height: 76,
              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isActive
                      ? const Color(0xFF0750EF)
                      : Colors.black,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: FittedBox(
                  child: Text(
                    isActive ? 'ACTIVE' : 'SELECT',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
