import 'package:flutter/material.dart';
import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_dimensions.dart';

RecommendationCardStyle buildPrimaryRecommendationCardTLightStyle() {
  return RecommendationCardStyle(
    backgroundColor: AppColors.primary_1,
    foregroundColor: AppColors.primary_5,
  );
}

RecommendationCardStyle buildSecondaryRecommendationCardTLightStyle() {
  return RecommendationCardStyle(
    backgroundColor: AppColors.secondarySoft,
    foregroundColor: AppColors.secondaryHard,
  );
}

RecommendationCardStyle buildTertiaryRecommendationCardTLightStyle() {
  return RecommendationCardStyle(
    backgroundColor: AppColors.tertiarySoft,
    foregroundColor: AppColors.tertiaryHard,
  );
}

class RecommendationCardStyle {
  final double padding = AppDimensions.spaceMedium;
  final double verticalGap = AppDimensions.spaceMedium;
  final double borderRadius = AppDimensions.spaceBorder;
  final Color backgroundColor;
  final Color foregroundColor;

  RecommendationCardStyle({
    required this.backgroundColor,
    required this.foregroundColor,
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
