import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrms_app/app/core/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int maxLines;
  final bool enabled;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final void Function()? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final String? prefixText;
  final TextStyle? prefixStyle;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.enabled = true,
    this.focusNode,
    this.textInputAction,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.readOnly = false,
    this.onTap,
    this.contentPadding,
    this.prefixText,
    this.prefixStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: prefixIcon,
              )
            : null,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 20,
          minHeight: 20,
        ),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
        contentPadding: contentPadding ?? const EdgeInsets.all(16),
        prefixText: prefixText,
        prefixStyle: prefixStyle ?? const TextStyle(color: Colors.black),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines,
      enabled: enabled,
      focusNode: focusNode,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      onTap: onTap,
      style: const TextStyle(
        fontSize: 14,
      ),
    );
  }
}
