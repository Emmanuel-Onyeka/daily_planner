import 'package:auto_route/auto_route.dart';
import 'package:dialy_planner/UI/widgets/animations/toggle_animation.dart';
import 'package:dialy_planner/shared/constants/app_spacing.dart';
import 'package:dialy_planner/shared/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScheduraBackButton extends StatelessWidget {
  const ScheduraBackButton({super.key, this.onTap, this.useCloseIcon = false});

  final VoidCallback? onTap;
  final bool useCloseIcon;

  @override
  Widget build(BuildContext context) {
    return ToggleAnimation(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.k12),
        child: InkWell(
          onTap: onTap ?? () => context.router.back(),
          child: Container(
            padding: const EdgeInsets.all(AppSpacing.k4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSpacing.k4),
              border: Border.all(
                color: context.colorScheme.outline,
                width: 1.5,
              ),
            ),
            child: Icon(
              useCloseIcon ? CupertinoIcons.clear : CupertinoIcons.back,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
