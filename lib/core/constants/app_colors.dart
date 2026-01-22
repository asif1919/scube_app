import 'package:flutter/material.dart';

/// App color constants following Clean Architecture
class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // ==================== Primary Colors ====================
  /// Primary brand blue used for splash, login, and dashboard header
  static const Color splashBackground = Color(0xFF0096FC);

  static const Color white = Color(0xFFFFFFFF);

  /// Text color on blue backgrounds
  static const Color splashText = Colors.white;

  /// Overall dashboard background behind cards
  static const Color dashboardBackground = Color(0xFFd9e4f1);

  /// Default card background color
  static const Color cardBackground = Colors.white;

  // ==================== Border Colors ====================
  /// Light border color for tables / cards
  static const Color borderLight = Color(0xFFE2E6EC);

  /// Light grey border for action grid
  static const Color borderGrey = Color(0xFFD1D5DB);

  // ==================== Text Colors ====================
  /// Dark title text (e.g. \"1st Page\", labels)
  static const Color textPrimary = Color(0xFF082438);

  /// Secondary grey text
  static const Color textSecondary = Color(0xFF6B7280);

  /// Medium grey text (electricity section title)
  static const Color textGrey = Color(0xFF979797);

  /// Dark grey text (temperature label)
  static const Color textDarkGrey = Color(0xFF555555);

  /// Dark blue text (donut chart)
  static const Color textDarkBlue = Color(0xFF1F2A44);

  /// Black text
  static const Color textBlack = Colors.black;

  // ==================== Gradient Colors ====================
  /// Gradient start blue
  static const Color gradientBlue = Color(0xFF2E63F7);

  /// Gradient end purple
  static const Color gradientPurple = Color(0xFFB982D9);

  // ==================== Temperature/Weather Colors ====================
  /// Temperature blue
  static const Color temperatureBlue = Color(0xFF0090FF);

  // ==================== Data View Card Colors ====================
  /// Light blue for data view cards
  static const Color dataViewBlue = Color(0xFF78c6ff);

  /// Orange for data type 2
  static const Color dataViewOrange = Color(0xFFFFA500);

  /// Light blue background for data view cards
  static const Color dataViewBackgroundBlue = Color(0xFFE5F4FE);

  /// Light purple background for total solar
  static const Color dataViewBackgroundPurple = Color(0xFFF0F1FF);

  // ==================== Button/UI Colors ====================
  /// Cyan for navigate button
  static const Color buttonCyan = Color(0xFF00c0e8);

  /// Blue for active status and inverter cards
  static const Color statusBlue = Color(0xFF0684D9);

  // ==================== Background Colors ====================
  /// Very light grey background (action grid)
  static const Color backgroundLightGrey = Color(0xFFF9FAFB);

  /// Highlighted row background
  static const Color rowHighlight = Color(0xFFEEF3F9);

  /// Purple icon background
  static const Color iconBackgroundPurple = Color(0xFFF4EAFF);

  /// Light blue ring for donut chart
  static const Color donutRingBlue = Color(0xFFD6ECFF);

  // ==================== Status/Error Colors ====================
  /// Red for notifications, errors, and inactive status
  static const Color errorRed = Colors.red;

  // ==================== Grey Shades ====================
  /// Light grey for scrollbar track
  static const Color grey300 = Color(0xFFE0E0E0);

  /// Medium grey for text field borders
  static const Color grey400 = Color(0xFFBDBDBD);

  /// Dark grey for scrollbar thumb and icons
  static const Color grey600 = Color(0xFF757575);

  /// Darker grey for underlined text buttons
  static const Color grey700 = Color(0xFF616161);

  /// Very dark grey for section titles
  static const Color grey900 = Color(0xFF212121);

  // ==================== Utility Colors ====================
  /// Transparent color
  static const Color transparent = Colors.transparent;
}
