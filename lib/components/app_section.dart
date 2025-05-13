import 'package:edu_teens/components/app_text.dart';
import 'package:edu_teens/components/app_text_button.dart';
import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:flutter/material.dart';

class AppSection extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeMore;
  final Widget content;

  const AppSection({
    super.key,
    required this.title,
    required this.content,
    this.onSeeMore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              title,
              size: AppTextSizeType.subtitle,
              weight: AppTextWeightType.medium,
            ),
            if (onSeeMore != null)
              AppTextButton(
                title: "Ver más",
                type: AppTextButtonType.text,
                onPress: onSeeMore,
              ),
          ],
        ),
        SizedBox(height: AppDimensions.spaceMedium, width: double.infinity),
        content,
      ],
    );
  }
}
