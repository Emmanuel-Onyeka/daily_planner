import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GettingStartedView extends StatelessWidget {
  const GettingStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: double.infinity,
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage("assets/images/img22.png"),
          //   fit: BoxFit.cover,
          // ),
        ),
      ),
    );
  }
}
