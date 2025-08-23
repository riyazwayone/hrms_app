import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors - Based on the green theme from the image
  static const Color primary = Color(0xFF9BB416); // Green color from the logo
  static const Color primaryDark = Color(0xFF6A9B39);
  static const Color primaryLight = Color(0xFF8FC555);

  // Secondary Colors
  static const Color secondary = Color(0xFF4CAF50);
  static const Color secondaryDark = Color(0xFF388E3C);
  static const Color secondaryLight = Color(0xFF66BB6A);

  // Background Colors
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFF9E9E9E);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Error Colors
  static const Color error = Color(0xFFE53935);
  static const Color errorLight = Color(0xFFFFCDD2);

  // Success Colors
  static const Color success = Color(0xFF43A047);
  static const Color successLight = Color(0xFFC8E6C9);

  // Warning Colors
  static const Color warning = Color(0xFFFF9800);
  static const Color warningLight = Color(0xFFFFE0B2);

  // Info Colors
  static const Color info = Color(0xFF2196F3);
  static const Color infoLight = Color(0xFFBBDEFB);

  // Border Colors
  static const Color border = Color(0xFFE0E0E0);
  static const Color borderDark = Color(0xFFBDBDBD);
  static const Color borderLight = Color(0xFFF5F5F5);

  // Shadow Colors
  static const Color shadow = Color(0x1F000000);
  static const Color shadowLight = Color(0x0A000000);

  // Button Colors
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = Color(0xFFE0E0E0);
  static const Color buttonDisabled = Color(0xFFBDBDBD);

  // Input Colors
  static const Color inputBackground = Color(0xFFFAFAFA);
  static const Color inputBorder = Color(0xFFE0E0E0);
  static const Color inputFocused = primary;

  static const Color gray = Color(0xFFBDBDBD);

  // Gradient Colors
  static const List<Color> primaryGradient = [
    Color(0xFF7DB442),
    Color(0xFFFFFFFF),
  ];

  static const List<Color> backgroundGradient = [
    Color(0xFFF5F5F5),
    Color(0xFFFFFFFF),
  ];
}
