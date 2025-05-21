import 'package:flutter/material.dart';
import 'package:edu_teens/consts/app_colors.dart';

AppSegmentedButtonStyle buildAppSegmentedButtonLightStyle() {
  return const AppSegmentedButtonStyle(
    backgroundColor: AppColors.primary_1,
    foregroundColor: AppColors.primary_2,
    labelColor: AppColors.neutralSubOrdinary,
    labelActiveColor: AppColors.primary,
  );
}

class AppSegmentedButtonStyle {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color labelColor;
  final Color labelActiveColor;


  const AppSegmentedButtonStyle({
    required this.foregroundColor,
    required this.backgroundColor,
    required this.labelColor,
    required this.labelActiveColor,
  });
}

class AppSegmentedButtonTheme extends ThemeExtension<AppSegmentedButtonTheme> {
  final AppSegmentedButtonStyle style;

  const AppSegmentedButtonTheme({required this.style});

  @override
  AppSegmentedButtonTheme copyWith({AppSegmentedButtonStyle? style}) {
    return AppSegmentedButtonTheme(style: style ?? this.style);
  }

  @override
  AppSegmentedButtonTheme lerp(ThemeExtension<AppSegmentedButtonTheme>? other, double t) {
    if (other is! AppSegmentedButtonTheme) return this;
    return this;
  }
}
