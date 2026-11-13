import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class ToggleSettingsCard extends StatelessWidget {
  final AppColors colors;
  final bool isMuted;
  final bool hapticsEnabled;
  final VoidCallback onMuteChanged;
  final VoidCallback onHapticsChanged;

  const ToggleSettingsCard({
    super.key,
    required this.colors,
    required this.isMuted,
    required this.hapticsEnabled,
    required this.onMuteChanged,
    required this.onHapticsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colors.card,
        border: Border.all(color: colors.border.withOpacity(.6)),
      ),
      child: Row(
        children: [
          Expanded(
            child: _ToggleCard(
              title: 'AUDIO',
              value: isMuted ? 'MUTED' : 'UNMUTED',
              buttonColor: const Color(0xFF742034),
              onTap: onMuteChanged,
              colors: colors,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: _ToggleCard(
              title: 'VIBRATION',
              value: hapticsEnabled ? 'HAPTICS: ON' : 'HAPTICS: OFF',
              buttonColor: const Color(0xFF203E7C),
              onTap: onHapticsChanged,
              colors: colors,
            ),
          ),
        ],
      ),
    );
  }
}

class _ToggleCard extends StatelessWidget {
  final String title;
  final String value;
  final Color buttonColor;
  final VoidCallback onTap;
  final AppColors colors;

  const _ToggleCard({
    required this.title,
    required this.value,
    required this.buttonColor,
    required this.onTap,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.panel,
        border: Border.all(color: colors.border.withOpacity(.5)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.blueGrey[200],
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            height: 62,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: FittedBox(child: Text(value, style: const TextStyle(fontSize: 16))),
            ),
          ),
        ],
      ),
    );
  }
}
