import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:flutter/material.dart';

LabelStyle buildNeutralLabelLightStyle() {
  return LabelStyle(
    backgroundColor: AppColors.neutralInverted,
    foregroundColor: AppColors.neutralBase,
    cancelIconColor: AppColors.neutralDisabled,
    filledBackgroundColor: AppColors.neutralBase,
    filledForegroundColor: AppColors.neutralInverted,
    filledCancelIconColor: AppColors.neutralDisabled,
  );
}

LabelStyle buildDisabledLabelLightStyle() {
  return LabelStyle(
    backgroundColor: AppColors.neutralInverted,
    foregroundColor: AppColors.neutralSubOrdinary,
    cancelIconColor: AppColors.neutralDisabled,
    filledBackgroundColor: AppColors.neutralSubOrdinary,
    filledForegroundColor: AppColors.neutralInverted,
    filledCancelIconColor: AppColors.neutralDisabled,
  );
}

LabelStyle buildPrimaryLabelLightStyle() {
  return LabelStyle(
    backgroundColor: AppColors.primary_1,
    foregroundColor: AppColors.primary_5,
    cancelIconColor: AppColors.primary_2,
    filledBackgroundColor: AppColors.primary_5,
    filledForegroundColor: AppColors.neutralInverted,
    filledCancelIconColor: AppColors.primary_2,
  );
}

class LabelStyle {
  final double borderRadius = AppDimensions.spaceMedium;
  final double verticalPadding = AppDimensions.spaceSmall;
  final double horizontalGap = AppDimensions.spaceXSmall;
  final double horizontalPadding = AppDimensions.spaceMedium;
  final double leadingIconSize = AppDimensions.labelIconSize;
  final double cancelIconSize = AppDimensions.labelActionIconSize;

  final Color cancelIconColor;
  final Color backgroundColor;
  final Color foregroundColor;

  final Color filledCancelIconColor;
  final Color filledBackgroundColor;
  final Color filledForegroundColor;

  LabelStyle({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.cancelIconColor,
    required this.filledBackgroundColor,
    required this.filledForegroundColor,
    required this.filledCancelIconColor,
  });
}

class AppLabelVariantThemes extends ThemeExtension<AppLabelVariantThemes> {
  final LabelStyle neutral;
  final LabelStyle disabled;
  final LabelStyle primary;
  final LabelStyle secondary;
  final LabelStyle tertiary;
  final LabelStyle success;
  final LabelStyle error;
  final LabelStyle warning;

  const AppLabelVariantThemes({
    required this.neutral,
    required this.disabled,
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.success,
    required this.error,
    required this.warning,
  });

  @override
  AppLabelVariantThemes copyWith({
    LabelStyle? neutral,
    LabelStyle? disabled,
    LabelStyle? primary,
    LabelStyle? secondary,
    LabelStyle? tertiary,
    LabelStyle? success,
    LabelStyle? error,
    LabelStyle? warning,
  }) {
    return AppLabelVariantThemes(
      neutral: neutral ?? this.neutral,
      disabled: disabled ?? this.disabled,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      success: success ?? this.success,
      error: error ?? this.error,
      warning: warning ?? this.warning,
    );
  }

  @override
  AppLabelVariantThemes lerp(
    ThemeExtension<AppLabelVariantThemes>? other,
    double t,
  ) {
    if (other is! AppLabelVariantThemes) return this;
    return this;
  }
}
