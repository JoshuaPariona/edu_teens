import 'package:flutter/material.dart';
import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_dimensions.dart';

CourseCardStyle buildPrimaryCourseCardLightStyle() {
  return CourseCardStyle(
    iconBackgroundColor: AppColors.primary,
    color: AppColors.primary_1,
  );
}

CourseCardStyle buildSecondaryCourseCardLightStyle() {
  return CourseCardStyle(
    iconBackgroundColor: AppColors.secondaryHard,
    color: AppColors.secondarySoft,
  );
}

CourseCardStyle buildTertiaryCourseCardLightStyle() {
  return CourseCardStyle(
    iconBackgroundColor: AppColors.tertiaryHard,
    color: AppColors.tertiarySoft,
  );
}

class CourseCardStyle {
  final double padding = AppDimensions.spaceMedium;
  final double verticalGap = AppDimensions.spaceMedium;
  final double borderRadius = AppDimensions.spaceBorder;
  final BoxShadow boxShadow = BoxShadow(
    blurRadius: AppDimensions.spaceXSmall,
    offset: Offset(2, 2),
    color: AppColors.neutralDisabled,
  );

  final double iconPadding = AppDimensions.spaceLarge;
  final double iconSize = AppDimensions.spaceXLarge;
  final Color iconForegroundColor = AppColors.neutralInverted;
  final Color titleColor = AppColors.neutralBase;

  final Color iconBackgroundColor;
  final Color color;

  CourseCardStyle({required this.color, required this.iconBackgroundColor});
}

class CourseCardTheme extends ThemeExtension<CourseCardTheme> {
  final CourseCardStyle primary;
  final CourseCardStyle secondary;
  final CourseCardStyle tertiary;

  const CourseCardTheme({
    required this.primary,
    required this.secondary,
    required this.tertiary,
  });

  @override
  CourseCardTheme copyWith({
    CourseCardStyle? primary,
    CourseCardStyle? secondary,
    CourseCardStyle? tertiary,
  }) {
    return CourseCardTheme(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
    );
  }

  @override
  CourseCardTheme lerp(ThemeExtension<CourseCardTheme>? other, double t) {
    if (other is! CourseCardTheme) return this;
    return this;
  }
}
