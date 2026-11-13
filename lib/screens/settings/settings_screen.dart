import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/settings/settings_header.dart';
import '../../widgets/settings/settings_tabs.dart';
import '../../widgets/settings/toggle_settings_card.dart';
import '../../widgets/settings/value_slider_card.dart';
import '../../widgets/settings/audio_visualizer.dart';
import '../../widgets/settings/settings_bottom_navigation.dart';
import '../../widgets/themes/theme_palette_dialog.dart';

class SettingsScreen extends StatefulWidget {
  final AppColors theme;
  final int selectedThemeIndex;
  final ValueChanged<int> onThemeSelected;

  const SettingsScreen({
    super.key,
    required this.theme,
    required this.selectedThemeIndex,
    required this.onThemeSelected,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int selectedTab = 0;
  bool isMuted = true;
  bool hapticsEnabled = true;
  double volume = 31;
  double vibration = 85;

  @override
  Widget build(BuildContext context) {
    final colors = widget.theme;

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: colors.panel,
                    border: Border.all(color: colors.border, width: 2),
                  ),
                  child: Column(
                    children: [
                      SettingsHeader(colors: colors),
                      const SizedBox(height: 28),
                      SettingsTabs(
                        colors: colors,
                        selectedIndex: selectedTab,
                        onSelected: (index) => setState(() => selectedTab = index),
                      ),
                      const SizedBox(height: 28),
                      if (selectedTab == 0) ...[
                        ToggleSettingsCard(
                          colors: colors,
                          isMuted: isMuted,
                          hapticsEnabled: hapticsEnabled,
                          onMuteChanged: () => setState(() => isMuted = !isMuted),
                          onHapticsChanged: () => setState(
                            () => hapticsEnabled = !hapticsEnabled,
                          ),
                        ),
                        const SizedBox(height: 22),
                        ValueSliderCard(
                          colors: colors,
                          value: volume,
                          valueColor: colors.primary,
                          onChanged: (value) => setState(() => volume = value),
                        ),
                        const SizedBox(height: 22),
                        ValueSliderCard(
                          colors: colors,
                          value: vibration,
                          valueColor: colors.secondary,
                          showTestButton: true,
                          onChanged: (value) => setState(() => vibration = value),
                          onTest: () {
                            // Add a haptics package here to trigger real vibration.
                          },
                        ),
                        const SizedBox(height: 28),
                        AudioVisualizer(colors: colors),
                      ] else
                        Container(
                          width: double.infinity,
                          height: 220,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: colors.card,
                            border: Border.all(color: colors.border),
                          ),
                          child: Text(
                            selectedTab == 1 ? 'PROFILE SETTINGS' : 'ANALYTICS',
                            style: TextStyle(
                              color: colors.primary,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            SettingsBottomNavigation(
              colors: colors,
              onThemesTap: () => showDialog<void>(
                context: context,
                barrierColor: Colors.black.withOpacity(0.75),
                builder: (_) => ThemePaletteDialog(
                  selectedIndex: widget.selectedThemeIndex,
                  onThemeSelected: widget.onThemeSelected,
                  colors: colors,
                ),
              ),
              onSettingsTap: () => setState(() => selectedTab = 0),
            ),
          ],
        ),
      ),
    );
  }
}
