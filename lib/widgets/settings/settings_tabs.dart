import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class SettingsTabs extends StatelessWidget {
  final AppColors colors;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const SettingsTabs({
    super.key,
    required this.colors,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    const labels = ['AUDIO', 'PROFILE', 'ANALYTICS'];
    return Row(
      children: List.generate(labels.length, (index) {
        final selected = selectedIndex == index;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: index == 2 ? 0 : 8),
            child: GestureDetector(
              onTap: () => onSelected(index),
              child: Container(
                height: 62,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colors.card,
                  border: Border(
                    top: BorderSide(color: colors.border.withOpacity(.65)),
                    left: BorderSide(color: colors.border.withOpacity(.65)),
                    right: BorderSide(color: colors.border.withOpacity(.65)),
                    bottom: BorderSide(
                      color: selected ? colors.primary : colors.border,
                      width: selected ? 5 : 1,
                    ),
                  ),
                ),
                child: FittedBox(
                  child: Text(
                    labels[index],
                    style: TextStyle(
                      color: selected ? colors.primary : Colors.blueGrey[200],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
