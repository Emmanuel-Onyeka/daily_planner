import 'package:dialy_planner/UI/widgets/buttons/schedura_filled_button.dart';
import 'package:dialy_planner/UI/widgets/schedura_textfield.dart';
import 'package:dialy_planner/UI/widgets/texts_widget.dart';
import 'package:dialy_planner/shared/constants/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmailLoginWidget extends StatelessWidget {
  const EmailLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.viewInsetsOf(context),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          ScheduraTexts.displayMedium28(context, text: 'Sign Up'),
          ScheduraTexts.bodyMedium14(
            context,
            text: 'Let\'s get you set up',
            isGreyText: true,
          ),
          const Gap(AppSpacing.k20),
          //TODO: Remove this and add a page for selecting it and DP on user information page
          ScheduraTextField(
            hintText: 'Display Name',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
          ),
          const Gap(AppSpacing.k20),
          ScheduraTextField(
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
          ),
          const Gap(AppSpacing.k20),
          ScheduraTextField(
            hintText: 'Password',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.none,
            obscureText: true,
          ),
          const Gap(AppSpacing.k20),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              ScheduraTexts.bodySmall12(
                context,
                text: 'I agree to the terms and conditions',
                isGreyText: true,
              ),
            ],
          ),
          const Gap(AppSpacing.k20),
          ScheduraFilledButton.primary(text: "Sign Up", onPressed: () {}),
          const Gap(AppSpacing.k12),
        ],
      ),
    );
  }
}
