import 'package:flutter/material.dart';
import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_dimensions.dart';

InfoCardStyle buildInfoCardLightStyle() {
  return const InfoCardStyle(
    backgroundColor: AppColors.primary_4,
    foregroundColor: AppColors.neutralInverted,
    verticalPadding: AppDimensions.spaceLarge,
    horizontalPadding: AppDimensions.spaceLarge,
    verticalGap: AppDimensions.spaceXLarge,
    borderRadius: AppDimensions.spaceBorder,
  );
}

class InfoCardStyle {
  final Color backgroundColor;
  final Color foregroundColor;
  final double horizontalPadding;
  final double verticalPadding;
  final double verticalGap;
  final double borderRadius;

  const InfoCardStyle({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.verticalGap,
    required this.borderRadius,
  });
}

class InfoCardTheme extends ThemeExtension<InfoCardTheme> {
  final InfoCardStyle style;

  const InfoCardTheme({required this.style});

  @override
  InfoCardTheme copyWith({InfoCardStyle? style}) {
    return InfoCardTheme(style: style ?? this.style);
  }

  @override
  InfoCardTheme lerp(ThemeExtension<InfoCardTheme>? other, double t) {
    if (other is! InfoCardTheme) return this;
    return this;
  }
}
