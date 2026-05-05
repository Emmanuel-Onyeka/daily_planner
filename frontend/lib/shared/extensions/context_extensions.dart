//This file contains the extensions for the BuildContext widget

import 'package:dialy_planner/shared/constants/colors.dart';
import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  ThemeData get theme => Theme.of(this);
  bool get isDarkMode => theme.brightness == Brightness.dark;

  Color get greyTextColor =>
      isDarkMode ? AppColors.hintTextColorDark : AppColors.hintTextColorLight;
}
