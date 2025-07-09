//GradeCardTheme
import 'package:flutter/material.dart';
import 'package:edu_teens/consts/app_colors.dart';

GradeCardStyle buildGradeCardLightStyle() {
  return const GradeCardStyle(
    backgroundColor: AppColors.primary_3,
    backgroundColorActive: AppColors.primary_4,
    foregroundColor: AppColors.neutralInverted,
  );
}

class GradeCardStyle {
  final Color backgroundColor;
  final Color backgroundColorActive;
  final Color foregroundColor;

  const GradeCardStyle({
    required this.backgroundColor,
    required this.backgroundColorActive,
    required this.foregroundColor,
  });
}

class GradeCardTheme extends ThemeExtension<GradeCardTheme> {
  final GradeCardStyle style;

  const GradeCardTheme({required this.style});

  @override
  GradeCardTheme copyWith({GradeCardStyle? style}) {
    return GradeCardTheme(style: style ?? this.style);
  }

  @override
  GradeCardTheme lerp(ThemeExtension<GradeCardTheme>? other, double t) {
    if (other is! GradeCardTheme) return this;
    return this;
  }
}
