import 'package:flutter/material.dart';
import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_dimensions.dart';

AppAppBarStyle buildAppAppBarLightStyle() {
  return const AppAppBarStyle(
    backgroundColor: AppColors.primary,
    flexibleSpaceExpandedHeight: AppDimensions.flexibleSpaceExpandedHeight,
    collapseDuration: Duration(milliseconds: 100),
    horizontalPadding: AppDimensions.spaceMedium,
    verticalPadding: AppDimensions.spaceLarge,
    verticalGap: AppDimensions.spaceMedium,
    actionsGap: AppDimensions.spaceSmall,
    verticalFlexibleSpaceGap: AppDimensions.spaceSmall,
  );
}

class AppAppBarStyle {
  final Color backgroundColor;
  final double flexibleSpaceExpandedHeight;
  final Duration collapseDuration;
  final double horizontalPadding;
  final double verticalPadding;
  final double verticalGap;
  final double actionsGap;
  final double verticalFlexibleSpaceGap;

  const AppAppBarStyle({
    required this.flexibleSpaceExpandedHeight,
    required this.backgroundColor,
    required this.collapseDuration,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.verticalGap,
    required this.actionsGap,
    required this.verticalFlexibleSpaceGap,
  });
}

class AppAppBarTheme extends ThemeExtension<AppAppBarTheme> {
  final AppAppBarStyle style;

  const AppAppBarTheme({required this.style});

  @override
  AppAppBarTheme copyWith({AppAppBarStyle? style}) {
    return AppAppBarTheme(style: style ?? this.style);
  }

  @override
  AppAppBarTheme lerp(ThemeExtension<AppAppBarTheme>? other, double t) {
    if (other is! AppAppBarTheme) return this;
    return this;
  }
}
