import 'dart:io';
import 'dart:ui';

import 'package:dialy_planner/shared/constants/app_spacing.dart';
import 'package:dialy_planner/shared/constants/colors.dart';
import 'package:dialy_planner/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

/// A custom iOS-styled bottom sheet with light/dark mode support.
///
/// Usage:
/// ```dart
/// ScheduraBottomSheet.show(
///   context: context,
///   child: YourContentWidget(),
/// );
/// ```
@immutable
class ScheduraBottomSheet {
  const ScheduraBottomSheet._();

  /// Shows a custom iOS-styled modal bottom sheet.
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    bool? isDismissible,
    bool enableDrag = true,
    bool useRootNavigator = true,
    bool isScrollControlled = true,
    bool showDragHandle = true,
    bool showCloseButton = false,
    double? maxHeight,
    EdgeInsetsGeometry? contentPadding,
    VoidCallback? onClose,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible ?? !Platform.isIOS,
      enableDrag: enableDrag,
      useRootNavigator: useRootNavigator,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent,
      barrierColor: context.isDarkMode ? Colors.black54 : Colors.black26,
      builder: (ctx) => _ScheduraBottomSheetContent(
        title: title,
        showDragHandle: showDragHandle,
        showCloseButton: showCloseButton,
        maxHeight: maxHeight,
        contentPadding: contentPadding,
        onClose: onClose ?? () => Navigator.pop(ctx),
        child: child,
      ),
    );
  }
}

class _ScheduraBottomSheetContent extends StatelessWidget {
  const _ScheduraBottomSheetContent({
    required this.child,
    this.title,
    this.showDragHandle = true,
    this.showCloseButton = false,
    this.maxHeight,
    this.contentPadding,
    this.onClose,
  });

  final Widget child;
  final String? title;
  final bool showDragHandle;
  final bool showCloseButton;
  final double? maxHeight;
  final EdgeInsetsGeometry? contentPadding;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    final sheetColor = isDark
        ? AppColors.surfaceColorDarkBase
        : AppColors.surfaceColorLight;

    final handleColor = isDark ? Colors.white24 : Colors.black12;

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: maxHeight ?? MediaQuery.sizeOf(context).height * 0.9,
          ),
          decoration: BoxDecoration(
            color: isDark ? sheetColor.withValues(alpha: 0.92) : sheetColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: isDark ? Colors.black38 : Colors.black12,
                blurRadius: 20,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showDragHandle)
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 4),
                  child: Container(
                    width: 36,
                    height: 5,
                    decoration: BoxDecoration(
                      color: handleColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              if (title != null || showCloseButton)
                Padding(
                  padding: EdgeInsets.only(
                    right: AppSpacing.k16,
                    left: showCloseButton ? AppSpacing.k8 : AppSpacing.k16,
                    top: showDragHandle || showCloseButton
                        ? AppSpacing.k8
                        : AppSpacing.k16,
                    bottom: AppSpacing.k4,
                  ),
                  child: Row(
                    children: [
                      if (showCloseButton)
                        InkWell(
                          onTap: onClose,
                          child: Container(
                            padding: const EdgeInsets.all(AppSpacing.k8),
                            decoration: BoxDecoration(
                              color: context.theme.scaffoldBackgroundColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: isDark
                                      ? Colors.black38
                                      : Colors.black12,
                                  blurRadius: 2,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Icon(Icons.close_rounded, size: 26),
                          ),
                        ),
                      if (title != null)
                        Expanded(
                          child: Text(
                            title!,
                            style: context.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              if (title != null)
                Divider(
                  height: 1,
                  thickness: 0.5,
                  color: isDark
                      ? AppColors.borderColorDark
                      : AppColors.borderColorLight,
                ),
              Flexible(
                child: Padding(
                  padding:
                      contentPadding ??
                      const EdgeInsets.symmetric(
                        horizontal: AppSpacing.k16,
                        vertical: AppSpacing.k12,
                      ),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//BoxTime