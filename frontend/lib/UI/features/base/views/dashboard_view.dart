import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dialy_planner/UI/features/base/controller/base_controller.dart';
import 'package:dialy_planner/UI/features/calendar/views/calendar_view.dart';
import 'package:dialy_planner/UI/features/archive/views/archive_view.dart';
import 'package:dialy_planner/UI/features/focus/views/focus_view.dart';
import 'package:dialy_planner/UI/features/profile/views/profile_view.dart';
import 'package:dialy_planner/UI/features/task_manager/views/manage_task_view.dart';
import 'package:dialy_planner/UI/widgets/layout/app_scaffold.dart';
import 'package:dialy_planner/shared/constants/app_spacing.dart';
import 'package:dialy_planner/shared/constants/colors.dart';
import 'package:dialy_planner/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

@RoutePage()
class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(baseNotifierProvider.notifier);
    int tabIndex = ref.watch(baseNotifierProvider).currentTabIndex;

    return AppScaffold(
      body: PageView(
        controller: controller.pageController,
        physics: Platform.isAndroid
            ? null
            : const NeverScrollableScrollPhysics(),
        children: [
          EventsView(),
          CalendarView(),
          FocusView(),
          ManageTaskView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: Container(
        height: kToolbarHeight * 1.05,
        decoration: BoxDecoration(
          color: context.isDarkMode
              ? AppColors.surfaceColorDarkElevated
              : context.colorScheme.outline,
          borderRadius: BorderRadius.circular(AppSpacing.k40),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: AppSpacing.k20,
          vertical: AppSpacing.k8,
        ).copyWith(top: 0),
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.k20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildIconWidget(
              currentindex: tabIndex,
              index: 0,
              activeIcon: Iconsax.box_time,
              inactiveIcon: Iconsax.box_time_copy,
              onTap: () => controller.changeIndex(0),
            ),
            _buildIconWidget(
              currentindex: tabIndex,
              index: 1,
              activeIcon: Iconsax.calendar,
              inactiveIcon: Iconsax.calendar_1_copy,
              onTap: () => controller.changeIndex(1),
            ),
            _buildIconWidget(
              currentindex: tabIndex,
              index: 2,
              activeIcon: Iconsax.timer_start,
              inactiveIcon: Iconsax.timer_start_copy,
              onTap: () => controller.changeIndex(2),
            ),
            _buildIconWidget(
              currentindex: tabIndex,
              index: 3,
              activeIcon: Iconsax.task_square,
              inactiveIcon: Iconsax.task_square_copy,
              onTap: () => controller.changeIndex(3),
            ),
            _buildIconWidget(
              currentindex: tabIndex,
              index: 4,
              activeIcon: Iconsax.user,
              inactiveIcon: Iconsax.user_copy,
              onTap: () => controller.changeIndex(4),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _buildIconWidget({
    required int currentindex,
    required int index,
    required IconData activeIcon,
    required IconData inactiveIcon,
    required VoidCallback onTap,
  }) {
    Color activeColor = context.isDarkMode
        ? AppColors.surfaceColorDarkBase
        : Colors.black54;
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentindex == index ? activeColor : Colors.transparent,
        ),
        child: Icon(currentindex == index ? activeIcon : inactiveIcon),
      ),
    );
  }
}
