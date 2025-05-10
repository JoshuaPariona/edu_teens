import 'package:flutter/material.dart';
import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_durations.dart';
import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:edu_teens/consts/app_strings.dart';

BottomNavStyle buildBottomNavLightStyle() {
  return const BottomNavStyle(
    transitionDuration: AppDurations.pageTransition,

    indicatorColor: AppColors.primary_5,
    indicatorWidth: AppDimensions.tabIconSize + 2 * AppDimensions.spaceMedium,
    indicatorHeight: AppDimensions.tabIconSize + 2 * AppDimensions.spaceXSmall,
    borderRadius: BorderRadius.all(Radius.circular(AppDimensions.spaceMedium)),

    iconTabColor: AppColors.neutralSubOrdinary,
    iconVerticalPadding: AppDimensions.spaceXSmall,
    activeIconTabColor: AppColors.neutralInverted,
    iconTabSize: AppDimensions.tabIconSize,

    labelColor: AppColors.neutralSubOrdinary,
    activeLabelColor: AppColors.neutralBase,
    labelSize: AppDimensions.textDescription,
    labelFontFamily: AppStrings.appFontFamily,
    labelFontWeight: FontWeight.w500,

    backgroundColor: AppColors.neutralInverted,
    verticalGap: AppDimensions.spaceXSmall,
    verticalPadding: AppDimensions.spaceMedium,
  );
}

class BottomNavStyle {
  final Duration transitionDuration;

  final Color indicatorColor;
  final double indicatorWidth;
  final double indicatorHeight;
  final BorderRadiusGeometry borderRadius;

  final Color iconTabColor;
  final Color activeIconTabColor;
  final double iconTabSize;
  final double iconVerticalPadding;

  final Color labelColor;
  final Color activeLabelColor;
  final double labelSize;
  final String labelFontFamily;
  final FontWeight labelFontWeight;

  final Color backgroundColor;
  final double verticalGap;
  final double verticalPadding;

  const BottomNavStyle({
    required this.transitionDuration,
    required this.indicatorColor,
    required this.indicatorWidth,
    required this.indicatorHeight,
    required this.borderRadius,
    required this.iconTabColor,
    required this.activeIconTabColor,
    required this.iconTabSize,
    required this.iconVerticalPadding,
    required this.labelColor,
    required this.activeLabelColor,
    required this.labelSize,
    required this.labelFontFamily,
    required this.labelFontWeight,
    required this.backgroundColor,
    required this.verticalGap,
    required this.verticalPadding,
  });
}

class BottomNavTheme extends ThemeExtension<BottomNavTheme> {
  final BottomNavStyle style;

  const BottomNavTheme({required this.style});

  @override
  BottomNavTheme copyWith({BottomNavStyle? style}) {
    return BottomNavTheme(style: style ?? this.style);
  }

  @override
  BottomNavTheme lerp(ThemeExtension<BottomNavTheme>? other, double t) {
    if (other is! BottomNavTheme) return this;
    return this;
  }
}
