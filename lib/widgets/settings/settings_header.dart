import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class SettingsHeader extends StatelessWidget {
  final AppColors colors;
  const SettingsHeader({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'SETTINGS',
          style: TextStyle(
            color: colors.primary,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        SizedBox(
          width: 68,
          height: 68,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFF641C30),
              border: Border.all(color: const Color(0xFFE04470)),
            ),
            child: IconButton(
              onPressed: () => Navigator.maybePop(context),
              icon: const Icon(Icons.close, size: 38, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
