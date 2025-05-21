import 'package:edu_teens/components/app_label.dart';
import 'package:edu_teens/components/app_text.dart';
import 'package:edu_teens/consts/app_images.dart';
import 'package:edu_teens/theme/extensions/recommendation_card_variant_themes.dart';
import 'package:flutter/material.dart';

enum RecommendationCardType { primary, secondary, tertiary }

class Bound {
  final RecommendationCardStyle style;
  final AppLabelType labelType;
  final String foregroundImage;

  const Bound({
    required this.style,
    required this.labelType,
    required this.foregroundImage,
  });
}

class RecommendationCard extends StatelessWidget {
  final String label;
  final IconData labelIcon;
  final String message;
  final VoidCallback? onPress;
  final RecommendationCardType type;
  const RecommendationCard({
    super.key,
    required this.label,
    required this.message,
    required this.type,
    required this.labelIcon,
    this.onPress,
  });

  Bound _selectBound(RecommendationCardTheme theme) {
    switch (type) {
      case RecommendationCardType.primary:
        return Bound(
          foregroundImage: AppImages.eduRM,
          style: theme.primary,
          labelType: AppLabelType.primary,
        );
      case RecommendationCardType.secondary:
        return Bound(
          foregroundImage: AppImages.eduSurprise,
          style: theme.secondary,
          labelType: AppLabelType.secondary,
        );
      case RecommendationCardType.tertiary:
        return Bound(
          foregroundImage: AppImages.eduAlgebra,
          style: theme.tertiary,
          labelType: AppLabelType.tertiary,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<RecommendationCardTheme>()!;
    final bound = _selectBound(theme);

    return Container(
      height: 180,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: bound.style.backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(bound.style.borderRadius),
        ),
      ),
      width: double.infinity,
      child: GestureDetector(
        onTap: onPress,
        child: Stack(
          children: [
            Positioned(
              right: -100,
              top: -50,
              child: Container(
                height: 280,
                width: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bound.style.backgroundEllipseColor,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              top: 0,
              right: 0,
              child: Image.asset(bound.foregroundImage),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: bound.style.padding * 2,
                horizontal: bound.style.padding,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 0,
                      maxWidth: constraints.maxWidth * 0.5,
                    ),
                    child: IntrinsicWidth(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLabel(
                            label: label,
                            filled: true,
                            type: bound.labelType,
                            icon: labelIcon,
                          ),
                          SizedBox(height: bound.style.verticalGap),
                          AppText(
                            message,
                            size: AppTextSizeType.body,
                            weight: AppTextWeightType.medium,
                            color: bound.style.foregroundColor,
                          ),
                        ],
                      ),
                    ),
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
