import 'package:edu_teens/components/app_button.dart';
import 'package:edu_teens/components/app_label.dart';
import 'package:edu_teens/components/app_list.dart';
import 'package:edu_teens/components/app_page.dart';
import 'package:edu_teens/components/app_progress_slider.dart';
import 'package:edu_teens/components/app_text.dart';
import 'package:edu_teens/components/next_button.dart';
import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:edu_teens/data/courses.dart';
import 'package:edu_teens/providers/question_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create:
            (_) => QuestionStateProvider(
              questionCount: courses.first.subjects[0].questions.length,
            ),
        builder: (context, child) {
          final questionStateProvider = Provider.of<QuestionStateProvider>(
            context,
          );
          return Stack(
            children: [
              Column(
                children: [
                  QuestionsAppBar(),
                  Expanded(
                    child: AppPage(
                      scroll: false,
                      children: [
                        Expanded(
                          child: PageView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: questionStateProvider.pageController,
                            children:
                                courses.first.subjects[0].questions.map((
                                  question,
                                ) {
                                  return OptionsSubPage(question: question);
                                }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(bottom: 24, right: 16, child: PageNavigation()),
            ],
          );
        },
      ),
    );
  }
}

class QuestionsAppBar extends StatelessWidget {
  const QuestionsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final questionStateProvider = Provider.of<QuestionStateProvider>(context);
    final points = questionStateProvider.points;
    final maxPoints = questionStateProvider.maxPoints;
    final progress =
        (questionStateProvider.currentQuestionIndex + 1) /
        questionStateProvider.questionCount;

    return Container(
      decoration: BoxDecoration(color: AppColors.primary),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(AppIcons.close, color: AppColors.neutralInverted),
                iconSize: 14,
              ),
              AppLabel(
                label: "$points/$maxPoints",
                type: AppLabelType.primary,
                filled: false,
                icon: AppIcons.star,
              ),
            ],
          ),
          const SizedBox(height: 16),
          AppText(
            "Pregunta ${questionStateProvider.currentQuestionIndex + 1} de ${questionStateProvider.questionCount}",
            size: AppTextSizeType.body,
            weight: AppTextWeightType.regular,
            color: AppColors.neutralInverted,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          AppProgressSlider(
            foregroundColor: AppColors.secondaryHard,
            backgroundColor: AppColors.neutralSubOrdinary,
            progress: progress,
          ),
        ],
      ),
    );
  }
}

class PageNavigation extends StatelessWidget {
  const PageNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final questionStateProvider = Provider.of<QuestionStateProvider>(context);

    return Row(
      children: [
        AppButton(
          title: "Continuar",
          type: AppButtonType.secondary,
          onPress: () {
            questionStateProvider.validateSelectedOption();
          },
        ),
        const SizedBox(width: 16),
        NextButton(
          onPress:
              questionStateProvider.completed
                  ? () {
                    questionStateProvider.testComplete
                        ? context.pop()
                        : questionStateProvider.nextQuestion();
                  }
                  : null,
          type: NextButtonType.secondary,
        ),
      ],
    );
  }
}

class OptionsSubPage extends StatelessWidget {
  final Question question;
  const OptionsSubPage({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    final questionStateProvider = Provider.of<QuestionStateProvider>(context);

    return AppList(
      vertical: true,
      gap: 16,
      children: [
        Column(
          children: [
            AppText(
              question.title,
              size: AppTextSizeType.h4,
              weight: AppTextWeightType.medium,
              color: AppColors.primary_7,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            AppText(
              question.question,
              size: AppTextSizeType.h4,
              weight: AppTextWeightType.regular,
              color: AppColors.neutralBase,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        ...question.options.map((option) {
          final isSelected = questionStateProvider.selectedOption == option;
          final hasValidated = questionStateProvider.hasValidated;
          final validatedIsCorrect = questionStateProvider.validatedIsCorrect;

          if (isSelected) {
            if (hasValidated) {
              if (validatedIsCorrect == true) {
                return OptionCard(
                  option: option,
                  state: OptionCardState.correct,
                  onTap: () {
                    questionStateProvider.selectOption(option);
                  },
                );
              } else {
                return OptionCard(
                  option: option,
                  state: OptionCardState.incorrect,
                  onTap: () {
                    questionStateProvider.selectOption(option);
                  },
                );
              }
            } else {
              return OptionCard(
                option: option,
                state: OptionCardState.selected,
                onTap: () {
                  questionStateProvider.selectOption(option);
                },
              );
            }
          }
          return OptionCard(
            option: option,
            state: OptionCardState.idle,
            onTap: () {
              questionStateProvider.selectOption(option);
            },
          );
        }),
      ],
    );
  }
}

enum OptionCardState { idle, selected, correct, incorrect }

class ColorBundle {
  final Color? background;
  final Color? border;

  const ColorBundle({this.background, this.border});
}

class OptionCard extends StatelessWidget {
  final Option option;
  final OptionCardState state;
  final void Function() onTap;

  const OptionCard({
    super.key,
    required this.option,
    required this.state,
    required this.onTap,
  });

  ColorBundle get colorBundle {
    switch (state) {
      case OptionCardState.idle:
        return ColorBundle(background: AppColors.neutralDisabled);
      case OptionCardState.selected:
        return const ColorBundle(background: AppColors.primary_2);
      case OptionCardState.correct:
        return const ColorBundle(
          background: AppColors.successSoft,
          border: AppColors.successMedium,
        );
      case OptionCardState.incorrect:
        return const ColorBundle(
          background: AppColors.errorSoft,
          border: AppColors.errorHard,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: double.infinity,
        duration: const Duration(milliseconds: 400),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorBundle.background,
          border: Border.all(
            color: colorBundle.border ?? Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: AppText(
          option.option,
          size: AppTextSizeType.body,
          weight: AppTextWeightType.regular,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
