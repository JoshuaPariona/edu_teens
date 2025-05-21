import 'package:edu_teens/components/app_progress_slider.dart';
import 'package:edu_teens/components/app_text.dart';
import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:edu_teens/consts/app_routes.dart';
import 'package:edu_teens/data/courses.dart';
import 'package:edu_teens/theme/extensions/subject_progress_card_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubjectProgressCard extends StatelessWidget {
  final Subject subject;
  const SubjectProgressCard({super.key, required this.subject});

  String _toPercentage(double value) {
    final percentage = (value * 100).toStringAsFixed(0);
    return '$percentage%';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SubjectProgressCardTheme>()!;
    final complete = subject.progress == 1.0;
    final incomplete = subject.progress == 0.0;
    final inProgress = !complete && !incomplete;

    return GestureDetector(
      onTap: () => context.pushNamed(AppRoutes.questions.name),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.spaceSmall,
          horizontal: AppDimensions.spaceMedium,
        ),
        decoration: BoxDecoration(
          color: theme.style.backgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.spaceBorder),
          boxShadow: [
            BoxShadow(
              color: theme.style.shadowColor,
              blurRadius: AppDimensions.spaceXSmall,
              offset: const Offset(2, 2),
            ),
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: theme.style.foregroundColor,
              ),
              child: Center(
                child: AppText(
                  subject.order.toString().padLeft(2, '0'),
                  size: AppTextSizeType.h4,
                  weight: AppTextWeightType.medium,
                  color: theme.style.backgroundColor,
                ),
              ),
            ),
            const SizedBox(width: AppDimensions.spaceMedium),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    subject.name,
                    size: AppTextSizeType.body,
                    weight: AppTextWeightType.medium,
                    color: theme.style.titleColor,
                  ),
                  const SizedBox(height: AppDimensions.spaceXSmall),
                  AppText(
                    "${subject.questions.length} preguntas",
                    size: AppTextSizeType.description,
                    weight: AppTextWeightType.regular,
                    color: theme.style.subtitleColor,
                  ),
                  const SizedBox(height: AppDimensions.spaceXSmall),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        complete
                            ? AppIcons.check
                            : inProgress
                            ? AppIcons.progress
                            : AppIcons.notStarted,
                        size: AppDimensions.spaceMedium,
                        color:
                            complete
                                ? theme.style.completeColor
                                : inProgress
                                ? theme.style.inProgressColor
                                : theme.style.incompleteColor,
                      ),
                      const SizedBox(width: AppDimensions.spaceSmall),
                      AppText(
                        complete
                            ? "Completado"
                            : inProgress
                            ? "En progresso"
                            : "No iniciado",
                        size: AppTextSizeType.description,
                        weight: AppTextWeightType.regular,
                        color:
                            complete
                                ? theme.style.completeColor
                                : inProgress
                                ? theme.style.inProgressColor
                                : theme.style.incompleteColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDimensions.spaceXSmall),
                  Row(
                    children: [
                      Expanded(
                        child: AppProgressSlider(
                          foregroundColor:
                              complete
                                  ? theme.style.completeColor
                                  : inProgress
                                  ? theme.style.inProgressColor
                                  : theme.style.incompleteColor,
                          backgroundColor: theme.style.sliderBackgroundColor,
                          progress: subject.progress,
                        ),
                      ),
                      const SizedBox(width: AppDimensions.spaceSmall),
                      AppText(
                        _toPercentage(subject.progress),
                        size: AppTextSizeType.description,
                        weight: AppTextWeightType.medium,
                        color: complete
                            ? theme.style.completeColor
                            : inProgress
                            ? theme.style.inProgressColor
                            : theme.style.incompleteColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
