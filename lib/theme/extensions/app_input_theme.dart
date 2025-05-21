import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:edu_teens/consts/app_colors.dart';

AppInputStyle buildAppInputLightStyle() {
  return const AppInputStyle(
    backgroundColor: AppColors.neutralInverted,
    errorColor: AppColors.errorHard,
    borderColor: AppColors.primary_2,
    focusBorderColor: AppColors.primary_5,
    leadingColor: AppColors.primary,
    leadingDisableColor: AppColors.primary_2,
    labelColor: AppColors.neutralSubOrdinary,
    labelDisabledColor: AppColors.primary_2,
    tailBlurColor: AppColors.neutralDisabled,
    tailFocusColor: AppColors.neutralSubOrdinary,
    tailDisableColor: AppColors.primary_2,
    tailErrorColor: Colors.red,
    placeholderColor: AppColors.neutralBase,
  );
}

class AppInputStyle {
  final Color backgroundColor;
  final Color errorColor;

  final Color borderColor;
  final Color focusBorderColor;

  final Color leadingColor;
  final Color leadingDisableColor;

  final Color labelColor;
  final Color labelDisabledColor;

  final Color tailBlurColor;
  final Color tailFocusColor;
  final Color tailDisableColor;
  final Color tailErrorColor;

  final Color placeholderColor;

  final double borderRadius = AppDimensions.spaceBorder;
  final double verticalPadding = AppDimensions.spaceSmall;
  final double horizontalPadding = AppDimensions.spaceMedium;
  final double gap = AppDimensions.spaceSmall;
  final double height = 52;


  const AppInputStyle({
    required this.backgroundColor,
    required this.errorColor,
    required this.borderColor,
    required this.focusBorderColor,
    required this.leadingColor,
    required this.leadingDisableColor,
    required this.labelColor,
    required this.labelDisabledColor,
    required this.tailBlurColor,
    required this.tailFocusColor,
    required this.tailDisableColor,
    required this.tailErrorColor,
    required this.placeholderColor,
  });
}

class AppInputTheme extends ThemeExtension<AppInputTheme> {
  final AppInputStyle style;

  const AppInputTheme({required this.style});

  @override
  AppInputTheme copyWith({AppInputStyle? style}) {
    return AppInputTheme(style: style ?? this.style);
  }

  @override
  AppInputTheme lerp(ThemeExtension<AppInputTheme>? other, double t) {
    if (other is! AppInputTheme) return this;
    return this;
  }
}
