import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_strings.dart';
import 'package:edu_teens/theme/extensions/app_bar_theme.dart';
import 'package:edu_teens/theme/extensions/app_page_theme.dart';
import 'package:edu_teens/theme/extensions/bottom_nav_theme.dart';
import 'package:edu_teens/theme/extensions/elevated_button_variant_themes.dart';
import 'package:edu_teens/theme/extensions/icon_button_variant_themes.dart';
import 'package:edu_teens/theme/extensions/text_button_variant_themes.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: AppStrings.appFontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.primary,

    extensions: [
      ElevatedButtonVariantThemes(
        primary: buildPrimaryButtonLightStyle(),
        neutral: buildNeutralButtonLightStyle(),
        outlined: buildOutlinedButtonLightStyle(),
        secondary: buildSecondaryButtonLightStyle(),
      ),
      TextButtonVariantThemes(
        text: buildTextButtonLightStyle(),
        link: buildLinkButtonLightStyle(),
      ),
      IconButtonVariantThemes(
        primary: buildPrimaryIconButtonLightStyle(),
        neutral: buildNeutralIconButtonLightStyle(),
        outlined: buildOutlinedIconButtonLightStyle(),
        secondary: buildSecondaryIconButtonLightStyle(),
        text: buildTextIconButtonLightStyle(),
      ),
      BottomNavTheme(style: buildBottomNavLightStyle()),
      AppAppBarTheme(style: buildAppAppBarLightStyle()),
      AppPageTheme(style: buildAppPageLightStyle())
    ],

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: buildPrimaryButtonLightStyle()
    ),

    textButtonTheme: TextButtonThemeData(
      style: buildTextButtonLightStyle()
    ),

    iconButtonTheme: IconButtonThemeData(
      style: buildPrimaryIconButtonLightStyle()
    )
  );
}