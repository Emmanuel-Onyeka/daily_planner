import 'package:dialy_planner/UI/features/task_manager/controller/task_controller.dart';
import 'package:dialy_planner/UI/features/task_manager/widgets/task_widget.dart';
import 'package:dialy_planner/UI/widgets/texts_widget.dart';
import 'package:dialy_planner/shared/constants/app_images.dart';
import 'package:dialy_planner/shared/constants/app_spacing.dart';
import 'package:dialy_planner/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class EventsView extends ConsumerWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskState = ref.watch(taskNotifier);

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ScheduraTexts.displayLarge32(context, text: "Inbox"),
        const Gap(AppSpacing.k16),
        if (taskState.task.isEmpty)
          const _EmptyInboxWidget()
        else
          ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return TaskWidget();
            },
            separatorBuilder: (__, ___) => Gap(AppSpacing.k12),
            itemCount: 10,
          ),
      ],
    );
  }
}

class _EmptyInboxWidget extends StatelessWidget {
  const _EmptyInboxWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(context.screenHeight(0.35)),
        Image.asset(AppImages.emptyInbox, height: AppSpacing.k60 * 2, width: AppSpacing.k60 * 2),
        const Gap(AppSpacing.k12),
        ScheduraTexts.bodyLarge16(context, text: "You're all caught up!", fontWeight: FontWeight.w600),
        const Gap(AppSpacing.k4),
        ScheduraTexts.bodySmall12(
          context,
          text: "Your inbox is empty. Enjoy your free time.",
          fontWeight: FontWeight.w500,
          color: context.greyTextColor,
        ),
      ],
    );
  }
}
