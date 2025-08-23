import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Base font family
  static String get fontFamily => 'DMSans';

  // Heading Styles
  static TextStyle get h1 => TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
        height: 1.2,
      );

  static TextStyle get h2 => TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
        height: 1.2,
      );

  static TextStyle get h3 => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.3,
      );

  static TextStyle get h4 => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.3,
      );

  static TextStyle get h5 => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  static TextStyle get h6 => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  // Body Text Styles
  static TextStyle get bodyLarge => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  static TextStyle get bodyMedium => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  static TextStyle get bodySmall => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.textSecondary,
        height: 1.4,
      );

  // Label Styles
  static TextStyle get labelLarge => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  static TextStyle get labelMedium => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
        height: 1.3,
      );

  static TextStyle get labelSmall => TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
        height: 1.3,
      );

  // Button Text Styles
  static TextStyle get buttonLarge => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textOnPrimary,
        height: 1.2,
      );

  static TextStyle get buttonMedium => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.textOnPrimary,
        height: 1.2,
      );

  static TextStyle get buttonSmall => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.textOnPrimary,
        height: 1.2,
      );

  // Caption and Overline
  static TextStyle get caption => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.textHint,
        height: 1.3,
      );

  static TextStyle get overline => TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
        height: 1.6,
        letterSpacing: 1.5,
      );

  // Special Text Styles
  static TextStyle get welcome => TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
        height: 1.2,
      );

  static TextStyle get subtitle => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.textSecondary,
        height: 1.5,
      );

  static TextStyle get errorText => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.error,
        height: 1.3,
      );

  static TextStyle get successText => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.success,
        height: 1.3,
      );

  static TextStyle get linkText => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.primary,
        height: 1.4,
        decoration: TextDecoration.underline,
      );
}
