import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static const List<AppColors> palettes = [
    AppColors(
      name: 'Neon Default',
      primary: Color(0xFF00EDE5),
      secondary: Color(0xFFFFD52F),
      background: Color(0xFF02020C),
      panel: Color(0xFF103B46),
      card: Color(0xFF0D304C),
      border: Color(0xFF00DCE5),
    ),
    AppColors(
      name: 'Vaporwave Pink',
      primary: Color(0xFFFF20A0),
      secondary: Color(0xFF00E5FF),
      background: Color(0xFF08000C),
      panel: Color(0xFF351631),
      card: Color(0xFF241027),
      border: Color(0xFFFF20A0),
    ),
    AppColors(
      name: 'Matrix Green',
      primary: Color(0xFF00F060),
      secondary: Color(0xFFB5FF00),
      background: Color(0xFF000900),
      panel: Color(0xFF10392B),
      card: Color(0xFF09251C),
      border: Color(0xFF00F060),
    ),
    AppColors(
      name: 'Cyberpunk Orange',
      primary: Color(0xFFFF8500),
      secondary: Color(0xFF00CFFF),
      background: Color(0xFF0A0505),
      panel: Color(0xFF392323),
      card: Color(0xFF20151A),
      border: Color(0xFFFF8500),
    ),
  ];
}
