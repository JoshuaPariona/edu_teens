import 'package:flutter/material.dart';
import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_dimensions.dart';

CourseProgressCardStyle buildPrimaryCourseProgressCardLightStyle() {
  return CourseProgressCardStyle(color: AppColors.primary);
}

CourseProgressCardStyle buildSecondaryCourseProgressCardLightStyle() {
  return CourseProgressCardStyle(color: AppColors.secondaryHard);
}

CourseProgressCardStyle buildTertiaryCourseProgressCardLightStyle() {
  return CourseProgressCardStyle(color: AppColors.tertiaryHard);
}

class CourseProgressCardStyle {
  final double padding = AppDimensions.spaceMedium;
  final double verticalGap = AppDimensions.spaceSmall;
  final double iconSize = AppDimensions.spaceXLarge;
  final double borderRadius = AppDimensions.spaceBorder;
  final BoxShadow boxShadow = BoxShadow(
    blurRadius: AppDimensions.spaceXSmall,
    offset: Offset(2, 2),
    color: AppColors.neutralDisabled
  );
  final Color iconForegroundColor = AppColors.neutralInverted;
  final Color backgroundColor = AppColors.neutralInverted;
  final Color titleColor = AppColors.neutralBase;
  final Color subtitleColor = AppColors.neutralSubOrdinary;
  final Color sliderBackgroundColor = AppColors.neutralDisabled;
  final Color color;

  CourseProgressCardStyle({required this.color});
}

class CourseProgressCardTheme extends ThemeExtension<CourseProgressCardTheme> {
  final CourseProgressCardStyle primary;
  final CourseProgressCardStyle secondary;
  final CourseProgressCardStyle tertiary;

  const CourseProgressCardTheme({
    required this.primary,
    required this.secondary,
    required this.tertiary,
  });

  @override
  CourseProgressCardTheme copyWith({
    CourseProgressCardStyle? primary,
    CourseProgressCardStyle? secondary,
    CourseProgressCardStyle? tertiary,
  }) {
    return CourseProgressCardTheme(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
    );
  }

  @override
  CourseProgressCardTheme lerp(
    ThemeExtension<CourseProgressCardTheme>? other,
    double t,
  ) {
    if (other is! CourseProgressCardTheme) return this;
    return this;
  }
}
