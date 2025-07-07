import 'package:flutter/material.dart';
import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:edu_teens/consts/app_strings.dart';
import 'package:edu_teens/consts/app_durations.dart';

ButtonStyle buildPrimaryButtonLightStyle() {
  return ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.disabled)) return AppColors.primary_2;
      if (states.contains(WidgetState.pressed)) return AppColors.primary_7;
      if (states.contains(WidgetState.hovered)) return AppColors.primary_4;
      return AppColors.primary_5;
    }),
    foregroundColor: WidgetStateProperty.all(AppColors.neutralInverted),
    elevation: WidgetStateProperty.resolveWith<double>((states) {
      if (states.contains(WidgetState.hovered)) return 1;
      return 0;
    }),
    shadowColor: WidgetStateProperty.all(AppColors.transparent),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.spaceBorder),
      ),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(
        vertical: AppDimensions.spaceMedium,
        horizontal: AppDimensions.spaceLarge,
      ),
    ),
    textStyle: WidgetStateProperty.all(
      const TextStyle(
        fontFamily: AppStrings.appFontFamily,
        fontSize: AppDimensions.textBody,
        fontWeight: FontWeight.w500,
      ),
    ),
    animationDuration: AppDurations.buttonHoverDuration,
  );
}

ButtonStyle buildNeutralButtonLightStyle() {
  return ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.disabled))
        return AppColors.neutralDisabled;
      if (states.contains(WidgetState.pressed))
        return AppColors.neutralSubOrdinary;
      if (states.contains(WidgetState.hovered))
        return AppColors.neutralInverted;
      return AppColors.neutralInverted;
    }),
    foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.disabled))
        return AppColors.neutralInverted;
      if (states.contains(WidgetState.pressed))
        return AppColors.neutralInverted;
      if (states.contains(WidgetState.hovered))
        return AppColors.neutralSubOrdinary;
      return AppColors.neutralBase;
    }),
    elevation: WidgetStateProperty.resolveWith<double>((states) {
      if (states.contains(WidgetState.hovered)) return 1;
      return 0;
    }),
    shadowColor: WidgetStateProperty.all(AppColors.transparent),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.spaceBorder),
      ),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(
        vertical: AppDimensions.spaceMedium,
        horizontal: AppDimensions.spaceLarge,
      ),
    ),
    textStyle: WidgetStateProperty.all(
      const TextStyle(
        fontFamily: AppStrings.appFontFamily,
        fontSize: AppDimensions.textBody,
        fontWeight: FontWeight.w500,
      ),
    ),
    animationDuration: AppDurations.buttonHoverDuration,
  );
}

ButtonStyle buildOutlinedButtonLightStyle() {
  return ButtonStyle(
    backgroundColor: WidgetStateProperty.all(AppColors.neutralInverted),
    foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.disabled)) return AppColors.primary_2;
      if (states.contains(WidgetState.pressed)) return AppColors.primary_5;
      if (states.contains(WidgetState.hovered)) return AppColors.primary_4;
      return AppColors.primary_5;
    }),
    elevation: WidgetStateProperty.resolveWith<double>((states) {
      if (states.contains(WidgetState.hovered)) return 1;
      return 0;
    }),
    shadowColor: WidgetStateProperty.all(AppColors.transparent),
    side: WidgetStateProperty.resolveWith<BorderSide>((states) {
      if (states.contains(WidgetState.disabled)) {
        BorderSide(color: AppColors.primary_2, width: 1.0);
      }
      if (states.contains(WidgetState.pressed)) {
        return BorderSide(color: AppColors.primary_5, width: 1.0);
      }
      if (states.contains(WidgetState.hovered)) {
        return BorderSide(color: AppColors.primary_2, width: 1.0);
      }
      return BorderSide(color: AppColors.primary_3, width: 1.0);
    }),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.spaceBorder),
      ),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(
        vertical: AppDimensions.spaceMedium,
        horizontal: AppDimensions.spaceLarge,
      ),
    ),
    textStyle: WidgetStateProperty.all(
      const TextStyle(
        fontFamily: AppStrings.appFontFamily,
        fontSize: AppDimensions.textBody,
        fontWeight: FontWeight.w500,
      ),
    ),
    animationDuration: AppDurations.buttonHoverDuration,
  );
}

ButtonStyle buildSecondaryButtonLightStyle() {
  return ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.disabled)) return AppColors.secondarySoft;
      if (states.contains(WidgetState.pressed))
        return AppColors.secondaryMedium;
      if (states.contains(WidgetState.hovered))
        return AppColors.secondaryMedium;
      return AppColors.secondaryHard;
    }),
    foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.disabled))
        return AppColors.neutralDisabled;
      return AppColors.neutralBase;
    }),
    elevation: WidgetStateProperty.resolveWith<double>((states) {
      if (states.contains(WidgetState.hovered)) return 1;
      return 0;
    }),
    shadowColor: WidgetStateProperty.all(AppColors.transparent),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.spaceBorder),
      ),
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(
        vertical: AppDimensions.spaceMedium,
        horizontal: AppDimensions.spaceLarge,
      ),
    ),
    textStyle: WidgetStateProperty.all(
      const TextStyle(
        fontFamily: AppStrings.appFontFamily,
        fontSize: AppDimensions.textBody,
        fontWeight: FontWeight.w500,
      ),
    ),
    animationDuration: AppDurations.buttonHoverDuration,
  );
}

class ElevatedButtonVariantThemes
    extends ThemeExtension<ElevatedButtonVariantThemes> {
  final ButtonStyle primary;
  final ButtonStyle neutral;
  final ButtonStyle outlined;
  final ButtonStyle secondary;

  const ElevatedButtonVariantThemes({
    required this.primary,
    required this.neutral,
    required this.outlined,
    required this.secondary,
  });

  @override
  ElevatedButtonVariantThemes copyWith({
    ButtonStyle? primary,
    ButtonStyle? neutral,
    ButtonStyle? outlined,
    ButtonStyle? secondary,
  }) {
    return ElevatedButtonVariantThemes(
      primary: primary ?? this.primary,
      neutral: neutral ?? this.neutral,
      outlined: outlined ?? this.outlined,
      secondary: secondary ?? this.secondary,
    );
  }

  @override
  ElevatedButtonVariantThemes lerp(
    ThemeExtension<ElevatedButtonVariantThemes>? other,
    double t,
  ) {
    if (other is! ElevatedButtonVariantThemes) return this;
    return this;
  }
}
