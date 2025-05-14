import 'package:edu_teens/components/app_text.dart';
import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_dimensions.dart';
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
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary_1,
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
            color: AppColors.neutralBase,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: AppDimensions.spaceSmall,
          ),
          SizedBox(
              width: double.infinity,
              height: 12,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final totalWidth = constraints.maxWidth;
                  final progressWidth = totalWidth * progress;
                  return Stack(
                    children: [
                      Container(
                        width: totalWidth,
                        height: 12,
                        decoration: BoxDecoration(
                          color: AppColors.primary_2,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      Container(
                        width: progressWidth,
                        height: 12,
                        decoration: BoxDecoration(
                          color: AppColors.primary_6,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          SizedBox(
            height: AppDimensions.spaceSmall,
          ),
          AppText(
            _getPercentageMsg(progress),
            size: AppTextSizeType.description,
            weight: AppTextWeightType.medium,
            color: AppColors.primary_6,
          ),
          SizedBox(
            height: AppDimensions.spaceSmall,
          ),
          AppText(
            '¡Estás muy cerca de terminar, sigue practicando!',
            size: AppTextSizeType.description,
            weight: AppTextWeightType.regular,
            color: AppColors.neutralSubOrdinary,
          ),
          
        ],
      ),
    );
  }
}
