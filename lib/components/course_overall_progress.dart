import 'package:edu_teens/components/app_progress_slider.dart';
import 'package:edu_teens/components/app_text.dart';
import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:edu_teens/theme/extensions/course_overall_progress.dart';
import 'package:flutter/material.dart';

class CourseOverallProgress extends StatelessWidget {
  final double progress;
  const CourseOverallProgress({super.key, required this.progress});

  String _getPercentageMsg(double progress) {
    final int percentValue = (progress * 100).round();
    return "$percentValue% completado";
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CourseOverallProgressTheme>()!;
    return Container(
      decoration: BoxDecoration(
        color: theme.style.backgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.spaceBorder),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spaceMedium,
        vertical: AppDimensions.spaceLarge,
      ),
      child: Column(
        children: [
          AppText(
            'Mi avance',
            size: AppTextSizeType.subtitle,
            weight: AppTextWeightType.medium,
            color: theme.style.titleColor,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppDimensions.spaceSmall),
          SizedBox(
            width: double.infinity,
            height: 12,
            child: AppProgressSlider(
              foregroundColor: theme.style.sliderForegroundColor,
              backgroundColor: theme.style.sliderBackGroundColor,
              height: 12,
              progress: progress,
            ),
          ),
          SizedBox(height: AppDimensions.spaceSmall),
          AppText(
            _getPercentageMsg(progress),
            size: AppTextSizeType.description,
            weight: AppTextWeightType.medium,
            color: theme.style.subtitleColor,
          ),
          SizedBox(height: AppDimensions.spaceSmall),
          AppText(
            '¡Estás muy cerca de terminar, sigue practicando!',
            size: AppTextSizeType.description,
            weight: AppTextWeightType.regular,
            color: theme.style.messageColor,
          ),
        ],
      ),
    );
  }
}
