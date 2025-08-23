import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isOutlined;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final double? width;
  final double? height;
  final double? borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.width,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null && !isLoading;

    if (isOutlined) {
      return SizedBox(
        width: width,
        height: height ?? 48,
        child: OutlinedButton.icon(
          onPressed: isEnabled ? onPressed : null,
          icon: _buildIcon(),
          label: _buildLabel(),
          style: OutlinedButton.styleFrom(
            foregroundColor: textColor ?? AppColors.primary,
            side: BorderSide(
              color: backgroundColor ?? AppColors.primary,
              width: 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      width: width,
      height: height ?? 48,
      child: ElevatedButton.icon(
        onPressed: isEnabled ? onPressed : null,
        icon: _buildIcon(),
        label: _buildLabel(),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          foregroundColor: textColor ?? AppColors.textOnPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (isLoading) {
      return const SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }

    if (icon != null) {
      return Icon(icon, size: 18);
    }

    return const SizedBox.shrink();
  }

  Widget _buildLabel() {
    return Text(
      isLoading ? 'Loading...' : text,
      style: AppTextStyles.buttonMedium.copyWith(
        color: isOutlined
            ? (textColor ?? AppColors.primary)
            : (textColor ?? AppColors.textOnPrimary),
      ),
    );
  }
}
