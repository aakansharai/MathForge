import 'package:flutter/material.dart';

class AppColors {
  final String name;
  final Color primary;
  final Color secondary;
  final Color background;
  final Color panel;
  final Color card;
  final Color text;
  final Color border;

  const AppColors({
    required this.name,
    required this.primary,
    required this.secondary,
    required this.background,
    required this.panel,
    required this.card,
    this.text = Colors.white,
    required this.border,
  });
}
