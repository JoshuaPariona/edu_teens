import 'package:edu_teens/components/app_text.dart';
import 'package:edu_teens/theme/extensions/course_card_variant_themes.dart';
import 'package:flutter/material.dart';

enum CourseCardType { primary, secondary, tertiary }

class CourseCard extends StatelessWidget {
  final String title;
  final CourseCardType type;
  final IconData icon;
  final VoidCallback? onTap;
  const CourseCard({
    super.key,
    required this.title,
    required this.type,
    required this.icon,
    this.onTap,
  });

  CourseCardStyle _selectStyle(CourseCardTheme theme) {
    switch (type) {
      case CourseCardType.primary:
        return theme.primary;
      case CourseCardType.secondary:
        return theme.secondary;
      case CourseCardType.tertiary:
        return theme.tertiary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CourseCardTheme>()!;
    final style = _selectStyle(theme);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(style.padding),
        decoration: BoxDecoration(
          color: style.color,
          borderRadius: BorderRadius.all(Radius.circular(style.borderRadius)),
          boxShadow: [style.boxShadow],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: style.iconBackgroundColor,
              ),
              padding: EdgeInsets.all(style.padding),
              child: Center(
                child: Icon(
                  icon,
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
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
