import 'package:flutter/material.dart';

class FocusView extends StatelessWidget {
  const FocusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
        child: Text("Focus"),
      ),
    );
  }
}
