import 'package:auto_route/auto_route.dart';
import 'package:dialy_planner/UI/features/getting_started/controller/getting_started_controller.dart';
import 'package:dialy_planner/UI/widgets/buttons/schedura_filled_button.dart';
import 'package:dialy_planner/UI/widgets/texts_widget.dart';
import 'package:dialy_planner/router/router_config.gr.dart';
import 'package:dialy_planner/shared/constants/app_spacing.dart';
import 'package:dialy_planner/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class NotificationPreferencePage extends ConsumerWidget {
  const NotificationPreferencePage({super.key});

  static const _reminderOptions = [
    'Every 15 mins',
    'Every 30 mins',
    'Every 1 hour',
    'Every 2 hours',
  ];

  static const _soundOptions = [
    'Sound & Vibration',
    'Sound only',
    'Vibration only',
    'Silent',
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
          text: 'Step 3 of 3',
          isGreyText: true,
        ),
        Gap(AppSpacing.k8),
        ScheduraTexts.displayMedium28(
          context,
          text: 'Notification preferences',
        ),
        Gap(AppSpacing.k4),
        ScheduraTexts.bodyMedium14(
          context,
          text: 'Choose how you want to stay updated on your tasks',
          isGreyText: true,
        ),
        Gap(AppSpacing.k20),
        Expanded(
          child: Center(
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                // Reminder frequency
                _DropdownTile(
                  icon: LucideIcons.timer,
                  label: 'Reminder frequency',
                  value: state.reminderFrequency,
                  options: _reminderOptions,
                  onChanged: (v) => notifier.updateReminderFrequency(v),
                ),
                Gap(AppSpacing.k12),

                // Push notifications
                _ToggleTile(
                  icon: LucideIcons.bellRing,
                  label: 'Push notifications',
                  value: state.pushNotificationsEnabled,
                  onChanged: (_) => notifier.togglePushNotifications(),
                ),
                Gap(AppSpacing.k12),

                // Email reminders
                _ToggleTile(
                  icon: LucideIcons.mail,
                  label: 'Email reminders',
                  value: state.emailRemindersEnabled,
                  onChanged: (_) => notifier.toggleEmailReminders(),
                ),
                Gap(AppSpacing.k12),

                // Sound / vibration preference
                _DropdownTile(
                  icon: LucideIcons.volume2,
                  label: 'Sound & vibration',
                  value: state.soundVibrationPreference,
                  options: _soundOptions,
                  onChanged: (v) => notifier.updateSoundVibrationPreference(v),
                ),
                Gap(AppSpacing.k12),

                // Quiet hours
                _QuietHoursTile(
                  startTime: state.quietHoursStart,
                  endTime: state.quietHoursEnd,
                  onStartTap: () => _pickTime(
                    context,
                    initial:
                        state.quietHoursStart ??
                        const TimeOfDay(hour: 22, minute: 0),
                    onPicked: notifier.updateQuietHoursStart,
                  ),
                  onEndTap: () => _pickTime(
                    context,
                    initial:
                        state.quietHoursEnd ??
                        const TimeOfDay(hour: 7, minute: 0),
                    onPicked: notifier.updateQuietHoursEnd,
                  ),
                ),
                Gap(AppSpacing.k12),

                // Motivational nudges
                _ToggleTile(
                  icon: LucideIcons.sparkles,
                  label: 'Motivational nudges',
                  value: state.motivationalNudgesEnabled,
                  onChanged: (_) => notifier.toggleMotivationalNudges(),
                ),
                Gap(AppSpacing.k20),
              ],
            ),
          ),
        ),
        Gap(AppSpacing.k8),
        ScheduraFilledButton.primary(
          text: 'Get started',
          onPressed: () => context.pushRoute(DashboardRoute()),
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

/// A toggle row with icon, label, and adaptive switch.
class _ToggleTile extends StatelessWidget {
  const _ToggleTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.k8,
        vertical: AppSpacing.k8,
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
          Icon(icon, size: 20, color: context.colorScheme.primary),
          Gap(AppSpacing.k8),
          Expanded(child: ScheduraTexts.bodyLarge16(context, text: label)),
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

/// A dropdown selector tile with icon, label, and a bottom sheet picker.
class _DropdownTile extends StatelessWidget {
  const _DropdownTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  final IconData icon;
  final String label;
  final String value;
  final List<String> options;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showOptionsPicker(context),
      borderRadius: AppSpacing.kDefaultBorderRadius,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.k8,
          vertical: AppSpacing.k16,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: context.colorScheme.outline),
          borderRadius: AppSpacing.kDefaultBorderRadius,
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: context.colorScheme.primary),
            Gap(AppSpacing.k8),
            Expanded(child: ScheduraTexts.bodyLarge16(context, text: label)),
            ScheduraTexts.bodySmall12(
              context,
              text: value,
              color: context.greyTextColor,
            ),
            Gap(AppSpacing.k4 / 2),
            Icon(
              LucideIcons.chevronDown,
              size: 18,
              color: context.greyTextColor,
            ),
          ],
        ),
      ),
    );
  }

  void _showOptionsPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.k16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.k16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ScheduraTexts.titleLarge18(
                    context,
                    text: label,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Gap(AppSpacing.k12),
              ...options.map(
                (option) => ListTile(
                  title: ScheduraTexts.bodyLarge16(context, text: option),
                  trailing: option == value
                      ? Icon(
                          LucideIcons.check,
                          color: context.colorScheme.primary,
                          size: 20,
                        )
                      : null,
                  onTap: () {
                    onChanged(option);
                    Navigator.pop(ctx);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Quiet hours tile with start/end time pickers.
class _QuietHoursTile extends StatelessWidget {
  const _QuietHoursTile({
    required this.startTime,
    required this.endTime,
    required this.onStartTap,
    required this.onEndTap,
  });

  final TimeOfDay? startTime;
  final TimeOfDay? endTime;
  final VoidCallback onStartTap;
  final VoidCallback onEndTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.k8,
        vertical: AppSpacing.k12,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: (startTime != null || endTime != null)
              ? context.colorScheme.primary
              : context.colorScheme.outline,
        ),
        borderRadius: AppSpacing.kDefaultBorderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                LucideIcons.moonStar,
                size: 20,
                color: context.colorScheme.primary,
              ),
              Gap(AppSpacing.k8),
              Expanded(
                child: ScheduraTexts.bodyLarge16(context, text: 'Quiet hours'),
              ),
            ],
          ),
          Gap(AppSpacing.k12),
          Row(
            children: [
              Expanded(
                child: _QuietTimeButton(
                  label: 'From',
                  time: startTime,
                  onTap: onStartTap,
                ),
              ),
              Gap(AppSpacing.k12),
              Expanded(
                child: _QuietTimeButton(
                  label: 'To',
                  time: endTime,
                  onTap: onEndTap,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuietTimeButton extends StatelessWidget {
  const _QuietTimeButton({
    required this.label,
    required this.time,
    required this.onTap,
  });

  final String label;
  final TimeOfDay? time;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.k8),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.k12,
          vertical: AppSpacing.k12,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          border: Border.all(color: context.colorScheme.outline),
          borderRadius: BorderRadius.circular(AppSpacing.k8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScheduraTexts.bodySmall12(
              context,
              text: '$label: ',
              isGreyText: true,
            ),
            ScheduraTexts.bodyMedium14(
              context,
              text: time != null ? time!.format(context) : 'Set',
              color: time != null ? null : context.greyTextColor,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
