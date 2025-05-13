import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:flutter/material.dart';

enum AppTextWeightType { regular, medium, semibold, bold }

enum AppTextSizeType {
  h1,
  h2,
  h3,
  h4,
  subtitle,
  body,
  description,
  label,
  footnote,
}

class AppText extends StatelessWidget {
  final TextDecoration? decoration;
  final AppTextWeightType weight;
  final AppTextSizeType size;
  final Color color;
  final String text;

  const AppText(
    this.text, {
    super.key,
    this.weight = AppTextWeightType.regular,
    this.size = AppTextSizeType.body,
    this.color = AppColors.neutralBase,
    this.decoration,
  });

  double _getFontSize(AppTextSizeType size) {
    switch (size) {
      case AppTextSizeType.h1:
        return AppDimensions.textHeader1;
      case AppTextSizeType.h2:
        return AppDimensions.textHeader2;
      case AppTextSizeType.h3:
        return AppDimensions.textHeader3;
      case AppTextSizeType.h4:
        return AppDimensions.textHeader4;
      case AppTextSizeType.subtitle:
        return AppDimensions.textSubtitle;
      case AppTextSizeType.body:
        return AppDimensions.textBody;
      case AppTextSizeType.description:
        return AppDimensions.textDescription;
      case AppTextSizeType.label:
        return AppDimensions.textLabel;
      case AppTextSizeType.footnote:
        return AppDimensions.textFootnote;
    }
  }

  FontWeight _getFontWeight(AppTextWeightType size) {
    switch (size) {
      case AppTextWeightType.regular:
        return FontWeight.w400;
      case AppTextWeightType.medium:
        return FontWeight.w500;
      case AppTextWeightType.semibold:
        return FontWeight.w600;
      case AppTextWeightType.bold:
        return FontWeight.w700;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: _getFontSize(size),
        fontWeight: _getFontWeight(weight),
        decoration: decoration,
      ),
    );
  }
}
