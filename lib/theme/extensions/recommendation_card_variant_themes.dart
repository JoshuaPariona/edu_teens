import 'package:flutter/material.dart';
import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_dimensions.dart';

RecommendationCardStyle buildPrimaryRecommendationCardLightStyle() {
  return RecommendationCardStyle(
    backgroundColor: AppColors.primary_1,
    foregroundColor: AppColors.primary_5,
    backgroundEllipseColor: AppColors.primary_3,
  );
}

RecommendationCardStyle buildSecondaryRecommendationCardLightStyle() {
  return RecommendationCardStyle(
    backgroundColor: AppColors.secondarySoft,
    foregroundColor: AppColors.secondaryHard,
    backgroundEllipseColor: AppColors.secondaryHard,
  );
}

RecommendationCardStyle buildTertiaryRecommendationCardLightStyle() {
  return RecommendationCardStyle(
    backgroundColor: AppColors.tertiarySoft,
    foregroundColor: AppColors.tertiaryHard,
    backgroundEllipseColor: AppColors.tertiaryHard,
  );
}

class RecommendationCardStyle {
  final double padding = AppDimensions.spaceMedium;
  final double verticalGap = AppDimensions.spaceMedium;
  final double borderRadius = AppDimensions.spaceBorder;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color backgroundEllipseColor;

  RecommendationCardStyle({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.backgroundEllipseColor,
  });
}

class RecommendationCardTheme extends ThemeExtension<RecommendationCardTheme> {
  final RecommendationCardStyle primary;
  final RecommendationCardStyle secondary;
  final RecommendationCardStyle tertiary;

  const RecommendationCardTheme({
    required this.primary,
    required this.secondary,
    required this.tertiary,
  });

  @override
  RecommendationCardTheme copyWith({
    RecommendationCardStyle? primary,
    RecommendationCardStyle? secondary,
    RecommendationCardStyle? tertiary,
  }) {
    return RecommendationCardTheme(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
    );
  }

  @override
  RecommendationCardTheme lerp(
    ThemeExtension<RecommendationCardTheme>? other,
    double t,
  ) {
    if (other is! RecommendationCardTheme) return this;
    return this;
  }
}
