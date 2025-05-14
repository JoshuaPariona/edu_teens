import 'package:edu_teens/components/app_label.dart';
import 'package:edu_teens/components/app_text.dart';
import 'package:edu_teens/consts/app_images.dart';
import 'package:edu_teens/theme/extensions/recommendation_card_variant_themes.dart';
import 'package:flutter/material.dart';

enum RecommendationCardType { primary, secondary, tertiary }

class Bound {
  final RecommendationCardStyle style;
  final AppLabelType labelType;
  final String backgroundImage;
  final String foregroundImage;

  const Bound({
    required this.style,
    required this.labelType,
    required this.backgroundImage,
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
          backgroundImage: AppImages.primaryEllipse1,
          foregroundImage: AppImages.eduRM,
          style: theme.primary,
          labelType: AppLabelType.primary,
        );
      case RecommendationCardType.secondary:
        return Bound(
          backgroundImage: AppImages.secondaryEllipse1,
          foregroundImage: AppImages.eduSurprise,
          style: theme.secondary,
          labelType: AppLabelType.secondary,
        );
      case RecommendationCardType.tertiary:
        return Bound(
          backgroundImage: AppImages.tertiaryEllipse1,
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

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(bound.style.borderRadius)),
      child: Container(
        color: bound.style.backgroundColor,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              child: Image.asset(bound.backgroundImage),
            ),
            Positioned(
              bottom: 0,
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
