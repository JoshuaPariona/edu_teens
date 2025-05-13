import 'package:edu_teens/components/app_button.dart';
import 'package:edu_teens/components/app_text.dart';
import 'package:edu_teens/consts/app_images.dart';
import 'package:edu_teens/theme/extensions/info_card_theme.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String message;
  final String title;
  final VoidCallback? onPress;
  const InfoCard({
    super.key,
    required this.message,
    required this.title,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<InfoCardTheme>()!;

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(theme.style.borderRadius)),
      child: Container(
        color: theme.style.backgroundColor,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 90,
              child: Image.asset(AppImages.puzzle1),
            ),
            Positioned(top: 30, right: 15, child: Image.asset(AppImages.star1)),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(AppImages.eduLyingDown),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: theme.style.verticalPadding,
                horizontal: theme.style.horizontalPadding,
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
                          AppText(
                            message,
                            size: AppTextSizeType.subtitle,
                            weight: AppTextWeightType.medium,
                            color: theme.style.foregroundColor,
                          ),
                          SizedBox(height: theme.style.verticalGap),
                          AppButton(
                            title: title,
                            type: AppButtonType.secondary,
                            onPress: onPress,
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
