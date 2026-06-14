import 'package:flutter/material.dart';

class ManageTaskView extends StatelessWidget {
  const ManageTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
        child: Text("ManageTask"),
      ),
    );
  }
}
