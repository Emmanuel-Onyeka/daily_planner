import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:dialy_planner/shared/extensions/context_extensions.dart';
import 'package:dialy_planner/shared/constants/app_spacing.dart';
import 'package:dialy_planner/UI/widgets/texts_widget.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.k16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.k12),
        color: context.theme.cardColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSpacing.k12,
        children: [
          Container(
            width: AppSpacing.k40,
            height: AppSpacing.k40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: context.taskCardColor,
              border: Border.all(
                // color: context.taskBorderColor,
                width: AppSpacing.k4 * 0.5,
              ),
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.check,
              size: AppSpacing.k24,
              // color: context.taskBorderColor,
            ),
          ),
          Expanded(
            child: Column(
              // spacing: AppSpacing.k12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScheduraTexts.bodyLarge16(
                  context,
                  text: 'AppStrings.taskOneTitle',
                  fontWeight: FontWeight.w600,
                ),
                const Gap(AppSpacing.k4 * 0.5),
                Row(
                  children: [
                    // SvgPicture.asset(
                    //   AppImages.clockIcon,
                    //   height: AppSpacing.k16,
                    //   width: AppSpacing.k16,
                    //   colorFilter: ColorFilter.mode(
                    //     context.taskBorderColor,
                    //     BlendMode.srcIn,
                    //   ),
                    // ),
                    const Gap(AppSpacing.k4),
                    ScheduraTexts.bodySmall12(
                      context,
                      text: 'AppStrings.taskOneTime',
                      fontWeight: FontWeight.w400,
                      color: context.greyTextColor,
                    ),
                  ],
                ),
                ScheduraTexts.bodySmall12(
                  context,
                  text: 'AppStrings.taskOneDescription',
                  fontWeight: FontWeight.w400,
                  color: context.greyTextColor,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
