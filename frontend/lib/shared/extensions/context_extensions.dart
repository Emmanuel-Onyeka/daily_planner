//This file contains the extensions for the BuildContext widget

import 'package:dialy_planner/shared/constants/colors.dart';
import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  //Theme Data
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  ThemeData get theme => Theme.of(this);
  bool get isDarkMode => theme.brightness == Brightness.dark;
  Color get greyTextColor =>
      isDarkMode ? AppColors.hintTextColorDark : AppColors.hintTextColorLight;

  //MediaQuery
  double screenWidth([double widthFactor = 1]) =>
      MediaQuery.sizeOf(this).width * widthFactor;
  double screenHeight([double heightFactor = 1]) =>
      MediaQuery.sizeOf(this).height * heightFactor;
}
