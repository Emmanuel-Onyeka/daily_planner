import 'package:flutter/material.dart';

class AppSpacing {
  static const double k4 = 4;
  static const double k8 = 8;
  static const double k12 = 12;
  static const double k16 = 16;
  static const double k20 = 20;
  static const double k24 = 24;
  static const double k28 = 28;
  static const double k32 = 32;
  static const double k40 = 40;
  static const double k48 = 48;
  static const double k60 = 60;

  // App padding
  static const double _kScaffoldPadding = 14;

  /// The default padding for the scaffold body.
  static EdgeInsets kScaffoldBodyPadding = const EdgeInsets.all(
    _kScaffoldPadding,
  );

  static BorderRadius kDefaultBorderRadius = BorderRadius.circular(k12);
}
