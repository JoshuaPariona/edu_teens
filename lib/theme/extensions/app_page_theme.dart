import 'package:flutter/material.dart';
import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_dimensions.dart';

AppPageStyle buildAppPageLightStyle() {
  return const AppPageStyle(
    backgroundColor: AppColors.neutralInverted,
    horizontalPadding: AppDimensions.spaceMedium,
    verticalPadding: AppDimensions.spaceLarge,
    verticalGap: AppDimensions.spaceLarge,
  );
}

class AppPageStyle {
  final Color backgroundColor;
  final double horizontalPadding;
  final double verticalPadding;
  final double verticalGap;

  const AppPageStyle({
    required this.backgroundColor,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.verticalGap,
  });
}

class AppPageTheme extends ThemeExtension<AppPageTheme> {
  final AppPageStyle style;

  const AppPageTheme({required this.style});

  @override
  AppPageTheme copyWith({AppPageStyle? style}) {
    return AppPageTheme(style: style ?? this.style);
  }

  @override
  AppPageTheme lerp(ThemeExtension<AppPageTheme>? other, double t) {
    if (other is! AppPageTheme) return this;
    return this;
  }
}
