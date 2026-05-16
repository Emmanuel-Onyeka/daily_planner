import 'package:dialy_planner/UI/features/getting_started/controller/getting_started_controller.dart';
import 'package:dialy_planner/UI/widgets/buttons/schedura_filled_button.dart';
import 'package:dialy_planner/UI/widgets/texts_widget.dart';
import 'package:dialy_planner/shared/constants/app_spacing.dart';
import 'package:dialy_planner/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class DailySchedulePage extends ConsumerWidget {
  const DailySchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gettingStartedNotifierProvider);
    final notifier = ref.read(gettingStartedNotifierProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ScheduraTexts.bodySmall12(
          context,
          text: 'Step 2 of 3',
          isGreyText: true,
        ),
        Gap(AppSpacing.k8),
        ScheduraTexts.displayMedium28(
          context,
          text: 'What\'s your daily schedule?',
        ),
        Gap(AppSpacing.k4),
        ScheduraTexts.bodyMedium14(
          context,
          text: 'We\'ll help you plan your day better',
          isGreyText: true,
        ),
        Gap(AppSpacing.k20),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              _ScheduleTimeRow(
                icon: LucideIcons.sunrise,
                label: 'Wake-up time',
                time: state.wakeUpTime,
                onTap: () => _pickTime(
                  context,
                  initial:
                      state.wakeUpTime ?? const TimeOfDay(hour: 6, minute: 0),
                  onPicked: notifier.updateWakeUpTime,
                ),
              ),
              Gap(AppSpacing.k12),
              _ScheduleTimeRow(
                icon: LucideIcons.moon,
                label: 'Sleep time',
                time: state.sleepTime,
                onTap: () => _pickTime(
                  context,
                  initial:
                      state.sleepTime ?? const TimeOfDay(hour: 22, minute: 0),
                  onPicked: notifier.updateSleepTime,
                ),
              ),
              Gap(AppSpacing.k20),
              _SectionLabel(text: 'Work / School hours'),
              Gap(AppSpacing.k8),
              _ScheduleTimeRangePair(
                startIcon: LucideIcons.briefcase,
                startLabel: 'Start',
                startTime: state.workStartTime,
                onStartTap: () => _pickTime(
                  context,
                  initial:
                      state.workStartTime ??
                      const TimeOfDay(hour: 9, minute: 0),
                  onPicked: notifier.updateWorkStart,
                ),
                endLabel: 'End',
                endTime: state.workEndTime,
                onEndTap: () => _pickTime(
                  context,
                  initial:
                      state.workEndTime ?? const TimeOfDay(hour: 17, minute: 0),
                  onPicked: notifier.updateWorkEnd,
                ),
              ),
              Gap(AppSpacing.k20),

              // Break periods
              _SectionLabel(text: 'Break periods'),
              Gap(AppSpacing.k8),
              _ScheduleTimeRangePair(
                startIcon: LucideIcons.coffee,
                startLabel: 'Start',
                startTime: state.breakStartTime,
                onStartTap: () => _pickTime(
                  context,
                  initial:
                      state.breakStartTime ??
                      const TimeOfDay(hour: 12, minute: 0),
                  onPicked: notifier.updateBreakStart,
                ),
                endLabel: 'End',
                endTime: state.breakEndTime,
                onEndTap: () => _pickTime(
                  context,
                  initial:
                      state.breakEndTime ??
                      const TimeOfDay(hour: 13, minute: 0),
                  onPicked: notifier.updateBreakEnd,
                ),
              ),
              Gap(AppSpacing.k20),

              // Preferred focus hours
              _SectionLabel(text: 'Preferred focus hours'),
              Gap(AppSpacing.k8),
              _ScheduleTimeRangePair(
                startIcon: LucideIcons.brain,
                startLabel: 'Start',
                startTime: state.focusStartTime,
                onStartTap: () => _pickTime(
                  context,
                  initial:
                      state.focusStartTime ??
                      const TimeOfDay(hour: 9, minute: 0),
                  onPicked: notifier.updateFocusStart,
                ),
                endLabel: 'End',
                endTime: state.focusEndTime,
                onEndTap: () => _pickTime(
                  context,
                  initial:
                      state.focusEndTime ??
                      const TimeOfDay(hour: 12, minute: 0),
                  onPicked: notifier.updateFocusEnd,
                ),
              ),
              Gap(AppSpacing.k20),

              // Busy periods
              _SectionLabel(text: 'Busy periods'),
              Gap(AppSpacing.k8),
              _ScheduleTimeRangePair(
                startIcon: LucideIcons.calendarClock,
                startLabel: 'Start',
                startTime: state.busyStartTime,
                onStartTap: () => _pickTime(
                  context,
                  initial:
                      state.busyStartTime ??
                      const TimeOfDay(hour: 14, minute: 0),
                  onPicked: notifier.updateBusyStart,
                ),
                endLabel: 'End',
                endTime: state.busyEndTime,
                onEndTap: () => _pickTime(
                  context,
                  initial:
                      state.busyEndTime ?? const TimeOfDay(hour: 16, minute: 0),
                  onPicked: notifier.updateBusyEnd,
                ),
              ),
              Gap(AppSpacing.k20),

              // Weekend schedule differs toggle
              _WeekendToggle(
                value: state.weekendScheduleDiffers,
                onChanged: (_) => notifier.toggleWeekendDiffers(),
              ),
              Gap(AppSpacing.k20),
            ],
          ),
        ),
        Gap(AppSpacing.k8),
        ScheduraFilledButton.primary(
          text: 'Continue',
          onPressed: () => notifier.changePage(2),
        ),
      ],
    );
  }

  Future<void> _pickTime(
    BuildContext context, {
    required TimeOfDay initial,
    required ValueChanged<TimeOfDay> onPicked,
  }) async {
    final picked = await showTimePicker(context: context, initialTime: initial);
    if (picked != null) onPicked(picked);
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return ScheduraTexts.bodyLarge16(
      context,
      text: text,
      fontWeight: FontWeight.w600,
    );
  }
}

/// A single-time row (e.g. Wake-up time, Sleep time).
class _ScheduleTimeRow extends StatelessWidget {
  const _ScheduleTimeRow({
    required this.icon,
    required this.label,
    required this.time,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final TimeOfDay? time;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppSpacing.kDefaultBorderRadius,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.k8,
          vertical: AppSpacing.k16,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: time != null
                ? context.colorScheme.primary
                : context.colorScheme.outline,
          ),
          borderRadius: AppSpacing.kDefaultBorderRadius,
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: context.colorScheme.primary),
            Gap(AppSpacing.k8),
            Expanded(child: ScheduraTexts.bodyLarge16(context, text: label)),
            ScheduraTexts.bodySmall12(
              context,
              text: time != null ? time!.format(context) : 'Set time',
              color: time != null ? null : context.greyTextColor,
            ),
            Gap(AppSpacing.k4 / 2),
            Icon(
              LucideIcons.chevronRight,
              size: 18,
              color: context.greyTextColor,
            ),
          ],
        ),
      ),
    );
  }
}

/// A time-range pair row (start & end side by side).
class _ScheduleTimeRangePair extends StatelessWidget {
  const _ScheduleTimeRangePair({
    required this.startIcon,
    required this.startLabel,
    required this.startTime,
    required this.onStartTap,
    required this.endLabel,
    required this.endTime,
    required this.onEndTap,
  });

  final IconData startIcon;
  final String startLabel;
  final TimeOfDay? startTime;
  final VoidCallback onStartTap;
  final String endLabel;
  final TimeOfDay? endTime;
  final VoidCallback onEndTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ScheduleTimeRow(
            icon: startIcon,
            label: startLabel,
            time: startTime,
            onTap: onStartTap,
          ),
        ),
        Gap(AppSpacing.k12),
        Expanded(
          child: _ScheduleTimeRow(
            icon: LucideIcons.flagTriangleRight,
            label: endLabel,
            time: endTime,
            onTap: onEndTap,
          ),
        ),
      ],
    );
  }
}

/// Weekend toggle row with a switch.
class _WeekendToggle extends StatelessWidget {
  const _WeekendToggle({required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.k16,
        vertical: AppSpacing.k12,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: value
              ? context.colorScheme.primary
              : context.colorScheme.outline,
        ),
        borderRadius: AppSpacing.kDefaultBorderRadius,
      ),
      child: Row(
        children: [
          Icon(
            LucideIcons.calendarDays,
            size: 20,
            color: context.colorScheme.primary,
          ),
          Gap(AppSpacing.k12),
          Expanded(
            child: ScheduraTexts.bodyLarge16(
              context,
              text: 'Weekend schedule differs?',
            ),
          ),
          Transform.scale(
            scale: 0.8,
            child: Switch.adaptive(
              value: value,
              onChanged: onChanged,
              activeThumbColor: context.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
