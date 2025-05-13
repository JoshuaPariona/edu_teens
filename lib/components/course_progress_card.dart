import 'package:edu_teens/components/app_text.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:edu_teens/theme/extensions/course_progress_card_variant_themes.dart';
import 'package:flutter/material.dart';

enum CourseProgressCardType { primary, secondary, tertiary }

class CourseProgressCard extends StatelessWidget {
  final String title;
  final double percentage;
  final CourseProgressCardType type;
  final IconData icon;
  final VoidCallback? onTap;
  const CourseProgressCard({
    super.key,
    required this.title,
    required this.percentage,
    required this.type,
    required this.icon,
    this.onTap,
  }) : assert(percentage >= 0.0 && percentage <= 1.0);

  String _getPercentageMsg(double percentage) {
    final int percentValue = (percentage * 100).round();
    return "Avanzado al $percentValue%";
  }

  CourseProgressCardStyle _selectStyle(CourseProgressCardTheme theme) {
    switch (type) {
      case CourseProgressCardType.primary:
        return theme.primary;
      case CourseProgressCardType.secondary:
        return theme.secondary;
      case CourseProgressCardType.tertiary:
        return theme.tertiary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CourseProgressCardTheme>()!;
    final style = _selectStyle(theme);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(style.padding),
        decoration: BoxDecoration(
          color: style.backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(style.borderRadius)),
          boxShadow: [style.boxShadow],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: style.color,
              ),
              padding: EdgeInsets.all(style.padding),
              child: Center(
                child: Icon(
                  AppIcons.computer,
                  size: style.iconSize,
                  color: style.iconForegroundColor,
                ),
              ),
            ),
            SizedBox(height: style.verticalGap),
            AppText(
              title,
              weight: AppTextWeightType.medium,
              size: AppTextSizeType.body,
              color: style.titleColor,
            ),
            SizedBox(height: style.verticalGap),
            AppText(
              _getPercentageMsg(percentage),
              weight: AppTextWeightType.regular,
              size: AppTextSizeType.description,
              color: style.subtitleColor,
            ),
            SizedBox(height: style.verticalGap),
            SizedBox(
              width: 150,
              height: 8,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final totalWidth = constraints.maxWidth;
                  final progressWidth = totalWidth * percentage;
                  return Stack(
                    children: [
                      Container(
                        width: totalWidth,
                        height: 8,
                        decoration: BoxDecoration(
                          color: style.sliderBackgroundColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      Container(
                        width: progressWidth,
                        height: 8,
                        decoration: BoxDecoration(
                          color: style.color,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
