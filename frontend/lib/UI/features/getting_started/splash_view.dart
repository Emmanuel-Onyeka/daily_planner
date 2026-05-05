import 'package:auto_route/auto_route.dart';
import 'package:dialy_planner/UI/widgets/texts_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScheduraTexts.displayLarge32(
          context,
          text: "Schedura",
          fontSize: 50,
        ),
      ),
    );
  }
}
