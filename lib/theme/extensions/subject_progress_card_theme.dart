import 'package:flutter/material.dart';
import 'package:edu_teens/consts/app_colors.dart';

SubjectProgressCardStyle buildSubjectProgressCardLightStyle() {
  return const SubjectProgressCardStyle(
    backgroundColor: AppColors.neutralInverted,
    foregroundColor: AppColors.primary_5,
    titleColor: AppColors.neutralBase,
    subtitleColor: AppColors.neutralSubOrdinary,
    shadowColor: AppColors.neutralDisabled,
    completeColor: AppColors.tertiaryHard,
    inProgressColor: AppColors.warningHard,
    incompleteColor: AppColors.neutralSubOrdinary,
    sliderBackgroundColor: AppColors.neutralDisabled,
  );
}

class SubjectProgressCardStyle {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color titleColor;
  final Color subtitleColor;
  final Color shadowColor;

  final Color completeColor;
  final Color inProgressColor;
  final Color incompleteColor;
  
  final Color sliderBackgroundColor;

  const SubjectProgressCardStyle({
    required this.foregroundColor,
    required this.backgroundColor,
    required this.titleColor,
    required this.subtitleColor,
    required this.shadowColor,
    required this.completeColor,
    required this.inProgressColor,
    required this.incompleteColor,
    required this.sliderBackgroundColor,
  });
}

class SubjectProgressCardTheme
    extends ThemeExtension<SubjectProgressCardTheme> {
  final SubjectProgressCardStyle style;

  const SubjectProgressCardTheme({required this.style});

  @override
  SubjectProgressCardTheme copyWith({SubjectProgressCardStyle? style}) {
    return SubjectProgressCardTheme(style: style ?? this.style);
  }

  @override
  SubjectProgressCardTheme lerp(
    ThemeExtension<SubjectProgressCardTheme>? other,
    double t,
  ) {
    if (other is! SubjectProgressCardTheme) return this;
    return this;
  }
}
