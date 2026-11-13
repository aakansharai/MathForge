import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class ValueSliderCard extends StatelessWidget {
  final AppColors colors;
  final double value;
  final Color valueColor;
  final ValueChanged<double> onChanged;
  final bool showTestButton;
  final VoidCallback? onTest;

  const ValueSliderCard({
    super.key,
    required this.colors,
    required this.value,
    required this.valueColor,
    required this.onChanged,
    this.showTestButton = false,
    this.onTest,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 22),
      decoration: BoxDecoration(
        color: colors.card,
        border: Border.all(color: colors.border.withOpacity(.65)),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${value.round()}%',
              style: TextStyle(
                color: valueColor,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 20,
                    activeTrackColor: valueColor,
                    inactiveTrackColor: valueColor.withOpacity(.25),
                    thumbColor: Colors.white,
                    overlayColor: valueColor.withOpacity(.15),
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 10,
                    ),
                  ),
                  child: Slider(
                    min: 0,
                    max: 100,
                    value: value.clamp(0, 100),
                    onChanged: onChanged,
                  ),
                ),
              ),
              if (showTestButton) ...[
                const SizedBox(width: 8),
                SizedBox(
                  width: 88,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: onTest,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF45455D),
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(color: Color(0xFFFFD52F)),
                      ),
                    ),
                    child: const Text('TEST', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
