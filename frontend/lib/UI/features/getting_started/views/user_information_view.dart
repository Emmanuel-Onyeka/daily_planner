import 'package:auto_route/auto_route.dart';
import 'package:dialy_planner/UI/features/getting_started/controller/getting_started_controller.dart';
import 'package:dialy_planner/UI/features/getting_started/views/sub-pages/daily_schedule_page.dart';
import 'package:dialy_planner/UI/features/getting_started/views/sub-pages/goal_page.dart';
import 'package:dialy_planner/UI/features/getting_started/views/sub-pages/notification_preference_page.dart';
import 'package:dialy_planner/UI/widgets/buttons/schedura_back_button.dart';
import 'package:dialy_planner/UI/widgets/layout/app_scaffold.dart';
import 'package:dialy_planner/shared/constants/colors.dart';
import 'package:dialy_planner/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class UserInformationView extends ConsumerWidget {
  const UserInformationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(gettingStartedNotifierProvider.notifier);
    final state = ref.watch(gettingStartedNotifierProvider);

    return AppScaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: ScheduraBackButton(
          onTap: () {
            if (state.currentPage == 0) {
              context.router.back();
            } else {
              controller.changePage(state.currentPage - 1);
            }
          },
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            3,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 3,
              width: 35,
              decoration: BoxDecoration(
                color: state.currentPage >= index
                    ? context.theme.primaryColor
                    : AppColors.hintTextColorDark,
                borderRadius: BorderRadius.circular(5),
              ),
              margin: EdgeInsets.symmetric(horizontal: 2),
            ),
          ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          GoalPage(),
          DailySchedulePage(),
          NotificationPreferencePage(),
        ],
      ),
    );
  }
}
