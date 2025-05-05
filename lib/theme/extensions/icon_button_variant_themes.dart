import 'package:flutter/material.dart';
import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_dimensions.dart';

ButtonStyle buildPrimaryIconButtonLightStyle() {
  return ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.disabled)) return AppColors.primary_2;
      if (states.contains(WidgetState.pressed)) return AppColors.primary_7;
      if (states.contains(WidgetState.hovered)) return AppColors.primary_4;
      return AppColors.primary_5;
    }),
    elevation: WidgetStateProperty.resolveWith<double>((states) {
      if (states.contains(WidgetState.hovered)) return 1;
      return 0;
    }),
    shadowColor: WidgetStateProperty.all(AppColors.transparent),
    iconSize: WidgetStateProperty.all(AppDimensions.textBody),
    iconColor: WidgetStateProperty.all(AppColors.neutralInverted),
    shape: WidgetStateProperty.all(CircleBorder()),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(
        vertical: AppDimensions.spaceMedium,
        horizontal: AppDimensions.spaceLarge,
      ),
    ),
    animationDuration: Duration(milliseconds: 300),
  );
}

ButtonStyle buildNeutralIconButtonLightStyle() {
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
    elevation: WidgetStateProperty.resolveWith<double>((states) {
      if (states.contains(WidgetState.hovered)) return 1;
      return 0;
    }),
    shadowColor: WidgetStateProperty.all(AppColors.transparent),
    iconSize: WidgetStateProperty.all(AppDimensions.textBody),
    iconColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.disabled))
        return AppColors.neutralInverted;
      if (states.contains(WidgetState.pressed))
        return AppColors.neutralInverted;
      if (states.contains(WidgetState.hovered))
        return AppColors.neutralSubOrdinary;
      return AppColors.neutralBase;
    }),
    shape: WidgetStateProperty.all(CircleBorder()),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(
        vertical: AppDimensions.spaceMedium,
        horizontal: AppDimensions.spaceLarge,
      ),
    ),
    animationDuration: Duration(milliseconds: 300),
  );
}

ButtonStyle buildOutlinedIconButtonLightStyle() {
  return ButtonStyle(
    backgroundColor: WidgetStateProperty.all(AppColors.neutralInverted),
    elevation: WidgetStateProperty.resolveWith<double>((states) {
      if (states.contains(WidgetState.hovered)) return 1;
      return 0;
    }),
    shadowColor: WidgetStateProperty.all(AppColors.transparent),
    iconSize: WidgetStateProperty.all(AppDimensions.textBody),
    iconColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.disabled)) return AppColors.primary_2;
      if (states.contains(WidgetState.pressed)) return AppColors.primary_5;
      if (states.contains(WidgetState.hovered)) return AppColors.primary_4;
      return AppColors.primary_5;
    }),
    shape: WidgetStateProperty.all(CircleBorder()),
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
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(
        vertical: AppDimensions.spaceMedium,
        horizontal: AppDimensions.spaceLarge,
      ),
    ),
    animationDuration: Duration(milliseconds: 300),
  );
}

ButtonStyle buildSecondaryIconButtonLightStyle() {
  return ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.disabled)) return AppColors.secondarySoft;
      if (states.contains(WidgetState.pressed))
        return AppColors.secondaryHarder;
      if (states.contains(WidgetState.hovered))
        return AppColors.secondaryMedium;
      return AppColors.secondaryHard;
    }),
    elevation: WidgetStateProperty.resolveWith<double>((states) {
      if (states.contains(WidgetState.hovered)) return 1;
      return 0;
    }),
    shadowColor: WidgetStateProperty.all(AppColors.transparent),
    iconSize: WidgetStateProperty.all(AppDimensions.textBody),
    iconColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.disabled))
        return AppColors.neutralDisabled;
      if (states.contains(WidgetState.pressed))
        return AppColors.neutralInverted;
      if (states.contains(WidgetState.hovered)) return AppColors.neutralBase;
      return AppColors.neutralBase;
    }),
    shape: WidgetStateProperty.all(CircleBorder()),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(
        vertical: AppDimensions.spaceMedium,
        horizontal: AppDimensions.spaceLarge,
      ),
    ),
    animationDuration: Duration(milliseconds: 300),
  );
}

ButtonStyle buildTextIconButtonLightStyle() {
  return ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.disabled))
        return AppColors.neutralInverted;
      if (states.contains(WidgetState.pressed)) return AppColors.primary_1;
      if (states.contains(WidgetState.hovered))
        return AppColors.neutralInverted;
      return Colors.transparent;
    }),
    elevation: WidgetStateProperty.resolveWith<double>((states) {
      if (states.contains(WidgetState.hovered)) return 1;
      return 0;
    }),
    shadowColor: WidgetStateProperty.all(AppColors.transparent),
    iconSize: WidgetStateProperty.all(AppDimensions.textBody),
    iconColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.disabled)) return AppColors.primary_2;
      if (states.contains(WidgetState.pressed)) return AppColors.primary_7;
      if (states.contains(WidgetState.hovered)) return AppColors.primary_4;
      return AppColors.primary_5;
    }),
    shape: WidgetStateProperty.all(CircleBorder()),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(
        vertical: AppDimensions.spaceMedium,
        horizontal: AppDimensions.spaceLarge,
      ),
    ),
    animationDuration: Duration(milliseconds: 300),
  );
}

class IconButtonVariantThemes extends ThemeExtension<IconButtonVariantThemes> {
  final ButtonStyle primary;
  final ButtonStyle neutral;
  final ButtonStyle outlined;
  final ButtonStyle secondary;
  final ButtonStyle text;

  const IconButtonVariantThemes({
    required this.primary,
    required this.neutral,
    required this.outlined,
    required this.secondary,
    required this.text,
  });

  @override
  IconButtonVariantThemes copyWith({
    ButtonStyle? primary,
    ButtonStyle? neutral,
    ButtonStyle? outlined,
    ButtonStyle? secondary,
    ButtonStyle? text,
  }) {
    return IconButtonVariantThemes(
      primary: primary ?? this.primary,
      neutral: neutral ?? this.neutral,
      outlined: outlined ?? this.outlined,
      secondary: secondary ?? this.secondary,
      text: text ?? this.text,
    );
  }

  @override
  IconButtonVariantThemes lerp(
    ThemeExtension<IconButtonVariantThemes>? other,
    double t,
  ) {
    if (other is! IconButtonVariantThemes) return this;
    return this;
  }
}
