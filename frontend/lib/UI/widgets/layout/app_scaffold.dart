import 'package:dialy_planner/shared/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.drawer,
    this.usePadding = true,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final bool usePadding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: GestureDetector(
        onTap: () {
          // if (Focus.of(context).hasFocus) FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: usePadding
                ? AppSpacing.kScaffoldBodyPadding
                : EdgeInsets.zero,
            child: body,
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
      drawer: drawer,
    );
  }
}
