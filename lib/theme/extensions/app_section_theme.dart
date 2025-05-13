import 'package:flutter/material.dart';
import 'package:edu_teens/consts/app_dimensions.dart';

AppPSectionStyle buildAppSectionLightStyle() {
  return const AppPSectionStyle(
    verticalGap: AppDimensions.spaceMedium,
  );
}

class AppPSectionStyle {
  final double verticalGap;

  const AppPSectionStyle({
    required this.verticalGap,
  });
}

class AppSectionTheme extends ThemeExtension<AppSectionTheme> {
  final AppPSectionStyle style;

  const AppSectionTheme({required this.style});

  @override
  AppSectionTheme copyWith({AppPSectionStyle? style}) {
    return AppSectionTheme(style: style ?? this.style);
  }

  @override
  AppSectionTheme lerp(ThemeExtension<AppSectionTheme>? other, double t) {
    if (other is! AppSectionTheme) return this;
    return this;
  }
}
