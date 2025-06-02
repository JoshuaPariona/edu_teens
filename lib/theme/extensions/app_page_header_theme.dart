import 'package:flutter/material.dart';
import 'package:edu_teens/consts/app_colors.dart';

AppPageHeaderStyle buildAppPageHeaderLightStyle() {
  return const AppPageHeaderStyle(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.neutralInverted,
  );
}

class AppPageHeaderStyle {
  final Color backgroundColor;
  final Color foregroundColor;

  const AppPageHeaderStyle({
    required this.foregroundColor,
    required this.backgroundColor,
  });
}

class AppPageHeaderTheme extends ThemeExtension<AppPageHeaderTheme> {
  final AppPageHeaderStyle style;

  const AppPageHeaderTheme({required this.style});

  @override
  AppPageHeaderTheme copyWith({AppPageHeaderStyle? style}) {
    return AppPageHeaderTheme(style: style ?? this.style);
  }

  @override
  AppPageHeaderTheme lerp(ThemeExtension<AppPageHeaderTheme>? other, double t) {
    if (other is! AppPageHeaderTheme) return this;
    return this;
  }
}
