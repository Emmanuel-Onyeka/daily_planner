import 'package:dialy_planner/shared/constants/app_fonts.dart';
import 'package:dialy_planner/shared/constants/app_spacing.dart';
import 'package:dialy_planner/shared/constants/colors.dart';
import 'package:dialy_planner/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A custom filled text field with light/dark mode support.
///
/// Usage:
/// ```dart
/// ScheduraTextField(
///   hintText: 'Enter your email',
///   controller: _emailController,
///   prefixIcon: LucideIcons.mail,
/// )
/// ```
class ScheduraTextField extends StatelessWidget {
  const ScheduraTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffix,
    this.prefix,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.focusNode,
    this.fillColor,
    this.borderRadius,
    this.contentPadding,
    this.style,
    this.hintStyle,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? suffix;
  final Widget? prefix;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final Color? fillColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? style;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final radius = borderRadius ?? AppSpacing.k12;

    final defaultFillColor =
        fillColor ??
        (isDark
            ? AppColors.surfaceColorDarkElevated
            : AppColors.backgroundColorLight);

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      enabled: enabled,
      readOnly: readOnly,
      autofocus: autofocus,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      inputFormatters: inputFormatters,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      onTap: onTap,
      focusNode: focusNode,
      cursorColor: context.colorScheme.primary,
      style:
          style ??
          context.textTheme.bodyLarge?.copyWith(fontFamily: AppFonts.outfit),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        filled: true,
        fillColor: defaultFillColor,
        hintStyle:
            hintStyle ??
            context.textTheme.bodyMedium?.copyWith(
              color: context.greyTextColor,
              fontFamily: AppFonts.outfit,
            ),
        labelStyle: context.textTheme.bodyMedium?.copyWith(
          color: context.greyTextColor,
          fontFamily: AppFonts.outfit,
        ),
        contentPadding:
            contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: AppSpacing.k16,
              vertical: AppSpacing.k16,
            ),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, size: 20, color: context.greyTextColor)
            : prefix,
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon, size: 20, color: context.greyTextColor)
            : suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: context.colorScheme.primary,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: AppColors.errorColor, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: AppColors.errorColor, width: 1.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide.none,
        ),
        errorStyle: const TextStyle(color: AppColors.errorColor, fontSize: 12),
      ),
    );
  }
}
