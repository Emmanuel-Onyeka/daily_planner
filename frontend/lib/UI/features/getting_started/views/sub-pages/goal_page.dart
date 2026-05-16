import 'package:dialy_planner/UI/widgets/buttons/schedura_filled_button.dart';
import 'package:dialy_planner/UI/features/getting_started/controller/getting_started_controller.dart';
import 'package:dialy_planner/UI/widgets/texts_widget.dart';
import 'package:dialy_planner/shared/constants/app_spacing.dart';
import 'package:dialy_planner/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class GoalPage extends ConsumerWidget {
  const GoalPage({super.key});

  final List<String> _goals = const [
    'Stay focused',
    'Stop procrastinating',
    'Manage study time',
    'Build routines',
    'Improve work productivity',
    'Reduce distractions',
    'Improve work-life balance',
    'Time block daily tasks',
    'Track habits',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gettingStartedNotifierProvider);
    final notifier = ref.read(gettingStartedNotifierProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ScheduraTexts.bodySmall12(
          context,
          text: 'Step 1 of 3',
          isGreyText: true,
        ),
        Gap(AppSpacing.k8),
        ScheduraTexts.displayMedium28(context, text: 'Tell us your goals'),
        Gap(AppSpacing.k4),
        ScheduraTexts.bodyMedium14(
          context,
          text: 'This will help us to personalize your experience',
          isGreyText: true,
        ),
        Gap(AppSpacing.k20),
        Expanded(
          child: ListView.separated(
            itemCount: _goals.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return _GoalCard(
                key: ValueKey(index),
                goal: _goals[index],
                isSelected: state.selectedGoals.contains(_goals[index]),
                onSelected: () => notifier.toggleGoal(_goals[index]),
              );
            },
            separatorBuilder: (context, index) => Gap(AppSpacing.k12),
          ),
        ),
        Gap(AppSpacing.k20),
        ScheduraFilledButton.primary(
          text: 'Continue',
          onPressed: () => notifier.changePage(1),
        ),
      ],
    );
  }
}

class _GoalCard extends StatelessWidget {
  const _GoalCard({
    super.key,
    required this.goal,
    required this.isSelected,
    required this.onSelected,
  });
  final String goal;
  final bool isSelected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelected,
      borderRadius: BorderRadius.circular(AppSpacing.k12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(AppSpacing.k16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? context.colorScheme.primary
                : context.colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(AppSpacing.k12),
        ),
        child: Row(
          children: [
            _smallCheckCard(context, isSelected: isSelected),
            Gap(AppSpacing.k12),
            ScheduraTexts.bodyLarge16(context, text: goal),
          ],
        ),
      ),
    );
  }

  Widget _smallCheckCard(BuildContext context, {required bool isSelected}) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: isSelected ? context.colorScheme.primary : Colors.transparent,
        border: Border.all(color: context.colorScheme.primary),
        borderRadius: BorderRadius.circular(AppSpacing.k4),
      ),
      child: isSelected
          ? Icon(LucideIcons.check, color: Colors.white, size: 16)
          : null,
    );
  }
}
