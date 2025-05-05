import 'package:flutter/material.dart';
import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:edu_teens/consts/app_strings.dart';

ButtonStyle buildTextButtonLightStyle() {
  return ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.disabled))
        return AppColors.neutralInverted;
      if (states.contains(WidgetState.pressed)) return AppColors.primary_1;
      if (states.contains(WidgetState.hovered))
        return AppColors.neutralInverted;
      return null;
    }),
    foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.disabled)) return AppColors.primary_2;
      if (states.contains(WidgetState.pressed)) return AppColors.primary_7;
      if (states.contains(WidgetState.hovered)) return AppColors.primary_4;
      return AppColors.primary_5;
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
  );
}

ButtonStyle buildLinkButtonLightStyle() {
  return ButtonStyle(
    backgroundColor: WidgetStateProperty.all(
      Colors.transparent,
    ),
    overlayColor: WidgetStateProperty.all(
      Colors.transparent,
    ),
    foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.disabled)) return AppColors.neutralDisabled;
      if (states.contains(WidgetState.pressed)) return AppColors.primary_6;
      if (states.contains(WidgetState.hovered)) return AppColors.primary_4;
      return AppColors.primary_5;
    }),
    padding: WidgetStateProperty.all(EdgeInsets.zero),
    textStyle: WidgetStateProperty.all(
      const TextStyle(
        fontFamily: AppStrings.appFontFamily,
        fontSize: AppDimensions.textBody,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
      ),
    ),
    shape: WidgetStateProperty.all(
      const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    ),
  );
}

class TextButtonVariantThemes extends ThemeExtension<TextButtonVariantThemes> {
  final ButtonStyle text;
  final ButtonStyle link;

  const TextButtonVariantThemes({required this.text, required this.link});

  @override
  TextButtonVariantThemes copyWith({ButtonStyle? text, ButtonStyle? link}) {
    return TextButtonVariantThemes(
      text: text ?? this.text,
      link: link ?? this.link,
    );
  }

  @override
  TextButtonVariantThemes lerp(
    ThemeExtension<TextButtonVariantThemes>? other,
    double t,
  ) {
    if (other is! TextButtonVariantThemes) return this;
    return this;
  }
}
