import 'package:flutter/material.dart';

/// App color constants following Clean Architecture
class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  /// Primary brand blue used for splash, login, and dashboard header
  static const Color splashBackground = Color(0xFF0096FC);

  static const Color white = Color(0xFFFFFFFF);

  /// Text color on blue backgrounds
  static const Color splashText = Colors.white;

  /// Overall dashboard background behind cards
  static const Color dashboardBackground = Color(0xFFd9e4f1);

  /// Default card background color
  static const Color cardBackground = Colors.white;

  /// Light border color for tables / cards
  static const Color borderLight = Color(0xFFE2E6EC);

  /// Dark title text (e.g. \"1st Page\", labels)
  static const Color textPrimary = Color(0xFF082438);

  /// Secondary grey text
  static const Color textSecondary = Color(0xFF6B7280);
}
