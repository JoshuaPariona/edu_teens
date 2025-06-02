import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:edu_teens/consts/app_durations.dart';
import 'package:edu_teens/consts/app_strings.dart';
import 'package:edu_teens/theme/extensions/app_bar_theme.dart';
import 'package:edu_teens/theme/extensions/app_input_theme.dart';
import 'package:edu_teens/theme/extensions/app_label_variant_themes.dart';
import 'package:edu_teens/theme/extensions/app_page_header_theme.dart';
import 'package:edu_teens/theme/extensions/app_page_theme.dart';
import 'package:edu_teens/theme/extensions/app_segmented_button_theme.dart';
import 'package:edu_teens/theme/extensions/bottom_nav_theme.dart';
import 'package:edu_teens/theme/extensions/course_card_variant_themes.dart';
import 'package:edu_teens/theme/extensions/course_overall_progress.dart';
import 'package:edu_teens/theme/extensions/course_progress_card_variant_themes.dart';
import 'package:edu_teens/theme/extensions/elevated_button_variant_themes.dart';
import 'package:edu_teens/theme/extensions/icon_button_variant_themes.dart';
import 'package:edu_teens/theme/extensions/info_card_theme.dart';
import 'package:edu_teens/theme/extensions/recommendation_card_variant_themes.dart';
import 'package:edu_teens/theme/extensions/subject_progress_card_theme.dart';
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
      AppPageTheme(style: buildAppPageLightStyle()),
      AppLabelVariantThemes(
        neutral: buildNeutralLabelLightStyle(),
        disabled: buildDisabledLabelLightStyle(),
        primary: buildPrimaryLabelLightStyle(),
        secondary: buildSecondaryLabelLightStyle(),
        tertiary: buildTertiaryLabelLightStyle(),
        success: buildPrimaryLabelLightStyle(), //TODO: ceate build functions
        error: buildPrimaryLabelLightStyle(),
        warning: buildPrimaryLabelLightStyle(),
      ),
      InfoCardTheme(style: buildInfoCardLightStyle()),
      CourseProgressCardTheme(
        primary: buildPrimaryCourseProgressCardLightStyle(),
        secondary: buildSecondaryCourseProgressCardLightStyle(),
        tertiary: buildTertiaryCourseProgressCardLightStyle(),
      ),
      RecommendationCardTheme(
        primary: buildPrimaryRecommendationCardLightStyle(),
        secondary: buildSecondaryRecommendationCardLightStyle(),
        tertiary: buildTertiaryRecommendationCardLightStyle(),
      ),
      CourseCardTheme(
        primary: buildPrimaryCourseCardLightStyle(),
        secondary: buildSecondaryCourseCardLightStyle(),
        tertiary: buildTertiaryCourseCardLightStyle(),
      ),
      AppInputTheme(style: buildAppInputLightStyle()),
      AppSegmentedButtonTheme(
        style: buildAppSegmentedButtonLightStyle(),
      ),
      CourseOverallProgressTheme(
        style: buildCourseOverallProgressLightStyle(),
      ),
      SubjectProgressCardTheme(
        style: buildSubjectProgressCardLightStyle(),
      ),
      AppPageHeaderTheme(style: buildAppPageHeaderLightStyle())
    ],

    textButtonTheme: TextButtonThemeData(style: buildTextButtonLightStyle()),

    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStateProperty.resolveWith<double>((states) {
          if (states.contains(WidgetState.hovered)) return 1;
          if (states.contains(WidgetState.pressed)) return 2;
          return 0;
        }),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
        iconSize: WidgetStateProperty.all(AppDimensions.appIconSize),
        iconColor: WidgetStateProperty.all(AppColors.neutralBase),
        animationDuration: AppDurations.buttonHoverDuration,
      ),
    ),
  );
}
