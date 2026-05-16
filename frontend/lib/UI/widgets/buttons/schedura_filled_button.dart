import 'package:dialy_planner/shared/constants/app_spacing.dart';
import 'package:dialy_planner/shared/constants/colors.dart';
import 'package:dialy_planner/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

@immutable
class ScheduraFilledButton extends StatelessWidget {
  const ScheduraFilledButton._({
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isExpanded = true,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.padding,
    this.elevation,
    this.fontSize,
    this.fontWeight,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isExpanded;
  final dynamic icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final double? fontSize;
  final FontWeight? fontWeight;

  /// Creates a primary elevated button that uses the app's
  /// theme-defined elevated button style.
  ///
  /// By default, the button expands to fill its parent width.
  /// Set [isExpanded] to `false` for an intrinsic-width button.
  factory ScheduraFilledButton.primary({
    required String text,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isExpanded = true,
    IconData? icon,
    Color? backgroundColor,
    Color? foregroundColor,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    double? elevation,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return ScheduraFilledButton._(
      text: text,
      onPressed: onPressed,
      isLoading: isLoading,
      isExpanded: isExpanded,
      icon: icon,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      borderRadius: borderRadius,
      padding: padding,
      elevation: elevation,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  factory ScheduraFilledButton.secondary({
    required String text,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool isExpanded = true,
    dynamic icon,
    Color? foregroundColor,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    double? elevation,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return ScheduraFilledButton._(
      text: text,
      onPressed: onPressed,
      isLoading: isLoading,
      isExpanded: isExpanded,
      icon: icon,
      backgroundColor: AppColors.secondaryDark,
      foregroundColor: foregroundColor,
      borderRadius: borderRadius,
      padding: padding,
      elevation: elevation,
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: elevation,
        padding:
            padding ?? EdgeInsetsGeometry.symmetric(vertical: AppSpacing.k12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? AppSpacing.k28),
        ),
        textStyle: context.textTheme.bodyLarge!.copyWith(
          fontSize: fontSize,
          fontWeight: fontWeight ?? FontWeight.w600,
        ),
      ),
      child: isLoading
          ? SizedBox(
              height: AppSpacing.k20,
              width: AppSpacing.k20,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(
                  foregroundColor ??
                      Theme.of(context)
                          .elevatedButtonTheme
                          .style
                          ?.foregroundColor
                          ?.resolve({}) ??
                      Colors.white,
                ),
              ),
            )
          : icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildIcon(icon),
                SizedBox(width: AppSpacing.k12),
                Text(text),
              ],
            )
          : Text(text),
    );

    if (isExpanded) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }

  Widget _buildIcon(dynamic icon) {
    if (icon is IconData) {
      return Icon(icon, size: AppSpacing.k20);
    }
    if (icon is String) {
      return Image.asset(icon, width: AppSpacing.k20, height: 20);
    }
    return Icon(Icons.error, size: AppSpacing.k20);
  }
}
