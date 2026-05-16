import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GettingStartedNotifier extends Notifier<GettingStartedState> {
  final PageController _pageController = PageController();

  @override
  GettingStartedState build() {
    ref.onDispose(() => _pageController.dispose());
    return GettingStartedState();
  }

  PageController get pageController => _pageController;

  void changePage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    state = state.copyWith(currentPage: index);
  }

  void toggleGoal(String goal) {
    state = state.copyWith(
      selectedGoals: state.selectedGoals.contains(goal)
          ? state.selectedGoals.where((g) => g != goal).toList()
          : [...state.selectedGoals, goal],
    );
  }

  void updateWakeUpTime(TimeOfDay time) {
    state = state.copyWith(wakeUpTime: time);
  }

  void updateSleepTime(TimeOfDay time) {
    state = state.copyWith(sleepTime: time);
  }

  void updateWorkStart(TimeOfDay time) {
    state = state.copyWith(workStartTime: time);
  }

  void updateWorkEnd(TimeOfDay time) {
    state = state.copyWith(workEndTime: time);
  }

  void updateBreakStart(TimeOfDay time) {
    state = state.copyWith(breakStartTime: time);
  }

  void updateBreakEnd(TimeOfDay time) {
    state = state.copyWith(breakEndTime: time);
  }

  void updateFocusStart(TimeOfDay time) {
    state = state.copyWith(focusStartTime: time);
  }

  void updateFocusEnd(TimeOfDay time) {
    state = state.copyWith(focusEndTime: time);
  }

  void updateBusyStart(TimeOfDay time) {
    state = state.copyWith(busyStartTime: time);
  }

  void updateBusyEnd(TimeOfDay time) {
    state = state.copyWith(busyEndTime: time);
  }

  void toggleWeekendDiffers() {
    state = state.copyWith(
      weekendScheduleDiffers: !state.weekendScheduleDiffers,
    );
  }

  // Notification preference methods
  void updateReminderFrequency(String frequency) {
    state = state.copyWith(reminderFrequency: frequency);
  }

  void togglePushNotifications() {
    state = state.copyWith(
      pushNotificationsEnabled: !state.pushNotificationsEnabled,
    );
  }

  void toggleEmailReminders() {
    state = state.copyWith(emailRemindersEnabled: !state.emailRemindersEnabled);
  }

  void updateSoundVibrationPreference(String preference) {
    state = state.copyWith(soundVibrationPreference: preference);
  }

  void updateQuietHoursStart(TimeOfDay time) {
    state = state.copyWith(quietHoursStart: time);
  }

  void updateQuietHoursEnd(TimeOfDay time) {
    state = state.copyWith(quietHoursEnd: time);
  }

  void toggleMotivationalNudges() {
    state = state.copyWith(
      motivationalNudgesEnabled: !state.motivationalNudgesEnabled,
    );
  }
}

final gettingStartedNotifierProvider =
    NotifierProvider.autoDispose<GettingStartedNotifier, GettingStartedState>(
      GettingStartedNotifier.new,
    );

class GettingStartedState {
  final int currentPage;
  final List<String> selectedGoals;

  // Daily schedule fields
  final TimeOfDay? wakeUpTime;
  final TimeOfDay? sleepTime;
  final TimeOfDay? workStartTime;
  final TimeOfDay? workEndTime;
  final TimeOfDay? breakStartTime;
  final TimeOfDay? breakEndTime;
  final TimeOfDay? focusStartTime;
  final TimeOfDay? focusEndTime;
  final TimeOfDay? busyStartTime;
  final TimeOfDay? busyEndTime;
  final bool weekendScheduleDiffers;

  // Notification preference fields
  final String reminderFrequency;
  final bool pushNotificationsEnabled;
  final bool emailRemindersEnabled;
  final String soundVibrationPreference;
  final TimeOfDay? quietHoursStart;
  final TimeOfDay? quietHoursEnd;
  final bool motivationalNudgesEnabled;

  GettingStartedState({
    this.currentPage = 0,
    this.selectedGoals = const [],
    this.wakeUpTime,
    this.sleepTime,
    this.workStartTime,
    this.workEndTime,
    this.breakStartTime,
    this.breakEndTime,
    this.focusStartTime,
    this.focusEndTime,
    this.busyStartTime,
    this.busyEndTime,
    this.weekendScheduleDiffers = false,
    this.reminderFrequency = 'Every 30 mins',
    this.pushNotificationsEnabled = true,
    this.emailRemindersEnabled = false,
    this.soundVibrationPreference = 'Sound & Vibration',
    this.quietHoursStart,
    this.quietHoursEnd,
    this.motivationalNudgesEnabled = true,
  });

  GettingStartedState copyWith({
    int? currentPage,
    List<String>? selectedGoals,
    TimeOfDay? wakeUpTime,
    TimeOfDay? sleepTime,
    TimeOfDay? workStartTime,
    TimeOfDay? workEndTime,
    TimeOfDay? breakStartTime,
    TimeOfDay? breakEndTime,
    TimeOfDay? focusStartTime,
    TimeOfDay? focusEndTime,
    TimeOfDay? busyStartTime,
    TimeOfDay? busyEndTime,
    bool? weekendScheduleDiffers,
    String? reminderFrequency,
    bool? pushNotificationsEnabled,
    bool? emailRemindersEnabled,
    String? soundVibrationPreference,
    TimeOfDay? quietHoursStart,
    TimeOfDay? quietHoursEnd,
    bool? motivationalNudgesEnabled,
  }) {
    return GettingStartedState(
      currentPage: currentPage ?? this.currentPage,
      selectedGoals: selectedGoals ?? this.selectedGoals,
      wakeUpTime: wakeUpTime ?? this.wakeUpTime,
      sleepTime: sleepTime ?? this.sleepTime,
      workStartTime: workStartTime ?? this.workStartTime,
      workEndTime: workEndTime ?? this.workEndTime,
      breakStartTime: breakStartTime ?? this.breakStartTime,
      breakEndTime: breakEndTime ?? this.breakEndTime,
      focusStartTime: focusStartTime ?? this.focusStartTime,
      focusEndTime: focusEndTime ?? this.focusEndTime,
      busyStartTime: busyStartTime ?? this.busyStartTime,
      busyEndTime: busyEndTime ?? this.busyEndTime,
      weekendScheduleDiffers:
          weekendScheduleDiffers ?? this.weekendScheduleDiffers,
      reminderFrequency: reminderFrequency ?? this.reminderFrequency,
      pushNotificationsEnabled:
          pushNotificationsEnabled ?? this.pushNotificationsEnabled,
      emailRemindersEnabled:
          emailRemindersEnabled ?? this.emailRemindersEnabled,
      soundVibrationPreference:
          soundVibrationPreference ?? this.soundVibrationPreference,
      quietHoursStart: quietHoursStart ?? this.quietHoursStart,
      quietHoursEnd: quietHoursEnd ?? this.quietHoursEnd,
      motivationalNudgesEnabled:
          motivationalNudgesEnabled ?? this.motivationalNudgesEnabled,
    );
  }
}
