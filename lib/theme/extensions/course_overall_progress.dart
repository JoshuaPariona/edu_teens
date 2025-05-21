import 'package:flutter/material.dart';
import 'package:edu_teens/consts/app_colors.dart';

CourseOverallProgressStyle buildCourseOverallProgressLightStyle() {
  return const CourseOverallProgressStyle(
    backgroundColor: AppColors.primary_1,
    titleColor: AppColors.neutralBase,
    sliderForegroundColor: AppColors.primary_6,
    sliderBackGroundColor: AppColors.primary_2,
    subtitleColor: AppColors.primary_6,
    messageColor: AppColors.neutralSubOrdinary,
  );
}

class CourseOverallProgressStyle {
  final Color backgroundColor;
  final Color titleColor;
  final Color sliderForegroundColor;
  final Color sliderBackGroundColor;
  final Color subtitleColor;
  final Color messageColor;


  const CourseOverallProgressStyle({
    required this.backgroundColor,
    required this.titleColor,
    required this.sliderForegroundColor,
    required this.sliderBackGroundColor,
    required this.subtitleColor, 
    required this.messageColor,
  });
}

class CourseOverallProgressTheme
    extends ThemeExtension<CourseOverallProgressTheme> {
  final CourseOverallProgressStyle style;

  const CourseOverallProgressTheme({required this.style});

  @override
  CourseOverallProgressTheme copyWith({CourseOverallProgressStyle? style}) {
    return CourseOverallProgressTheme(style: style ?? this.style);
  }

  @override
  CourseOverallProgressTheme lerp(
    ThemeExtension<CourseOverallProgressTheme>? other,
    double t,
  ) {
    if (other is! CourseOverallProgressTheme) return this;
    return this;
  }
}
