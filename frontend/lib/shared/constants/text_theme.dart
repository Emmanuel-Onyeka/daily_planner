import 'package:flutter/material.dart';
import 'package:dialy_planner/shared/constants/app_fonts.dart';
import 'package:dialy_planner/shared/constants/colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme get lightTextTheme {
    return const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.textColorLight,
        fontFamily: AppFonts.outfit,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.textColorLight,
        fontFamily: AppFonts.outfit,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.textColorLight,
        fontFamily: AppFonts.outfit,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textColorLight,
        fontFamily: AppFonts.outfit,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textColorLight,
        fontFamily: AppFonts.outfit,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.textColorLight,
        fontFamily: AppFonts.outfit,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.textColorLight,
        fontFamily: AppFonts.outfit,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.hintTextColorLight,
        fontFamily: AppFonts.outfit,
      ),
    );
  }

  static TextTheme get darkTextTheme {
    return const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.textColorDark,
        fontFamily: AppFonts.outfit,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.textColorDark,
        fontFamily: AppFonts.outfit,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.textColorDark,
        fontFamily: AppFonts.outfit,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textColorDark,
        fontFamily: AppFonts.outfit,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textColorDark,
        fontFamily: AppFonts.outfit,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.textColorDark,
        fontFamily: AppFonts.outfit,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.textColorDark,
        fontFamily: AppFonts.outfit,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.hintTextColorDark,
        fontFamily: AppFonts.outfit,
      ),
    );
  }
}
