import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class AudioVisualizer extends StatelessWidget {
  final AppColors colors;
  const AudioVisualizer({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      padding: const EdgeInsets.fromLTRB(12, 18, 12, 12),
      decoration: BoxDecoration(
        color: colors.card,
        border: Border.all(color: colors.primary),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(25, (index) {
          return Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              height: 88,
              decoration: BoxDecoration(
                color: index > 19 ? colors.secondary : colors.primary,
                border: Border(
                  bottom: BorderSide(color: colors.text, width: 4),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
