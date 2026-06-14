import 'package:auto_route/auto_route.dart';
import 'package:dialy_planner/UI/features/getting_started/email_login_widget.dart';
import 'package:dialy_planner/UI/widgets/buttons/schedura_filled_button.dart';
import 'package:dialy_planner/UI/widgets/layout/app_scaffold.dart';
import 'package:dialy_planner/UI/widgets/schedura_bottom_sheet.dart';
import 'package:dialy_planner/UI/widgets/texts_widget.dart';
import 'package:dialy_planner/router/router_config.gr.dart';
import 'package:dialy_planner/shared/constants/app_images.dart';
import 'package:dialy_planner/shared/constants/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

@RoutePage()
class GettingStartedView extends StatelessWidget {
  const GettingStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        children: [
          // Centered radial gradient glow
          Positioned.fill(
            child: Align(
              alignment: const Alignment(0.0, -0.15),
              child: Container(
                width: 340,
                height: 340,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF6366F1).withValues(alpha: 0.15),
                      const Color(0xFF818CF8).withValues(alpha: 0.06),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Gap(AppSpacing.k40),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSpacing.k20),
                ),
                child: Image.asset(AppImages.logo, width: 60, height: 60),
              ),
              Gap(AppSpacing.k20),
              ScheduraTexts.displayLarge32(
                context,
                text: 'Welcome\nto Schedura',
                center: true,
                fontSize: AppSpacing.k40,
              ),
              Spacer(),
              ScheduraTexts.bodyLarge16(
                context,
                text: 'A smarter way to own your day',
                center: true,
              ),
              Gap(AppSpacing.k24),
              ScheduraFilledButton.secondary(
                text: 'Continue with Google',
                icon: AppImages.google,
                onPressed: () => context.pushRoute(UserInformationRoute()),
              ),
              Gap(AppSpacing.k8),
              ScheduraFilledButton.secondary(
                text: 'Continue with Apple',
                icon: AppImages.apple,
                onPressed: () {},
              ),
              Gap(AppSpacing.k8),
              ScheduraFilledButton.secondary(
                text: 'Continue with Email',
                icon: LucideIcons.mail,
                onPressed: () {
                  ScheduraBottomSheet.show(
                    context: context,
                    showDragHandle: false,
                    showCloseButton: true,
                    child: const EmailLoginWidget(),
                  );
                },
              ),
              Gap(AppSpacing.k32),
            ],
          ),
        ],
      ),
    );
  }
}
