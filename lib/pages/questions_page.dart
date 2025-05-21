import 'package:edu_teens/components/app_button.dart';
import 'package:edu_teens/components/app_label.dart';
import 'package:edu_teens/components/app_list.dart';
import 'package:edu_teens/components/app_page.dart';
import 'package:edu_teens/components/app_text.dart';
import 'package:edu_teens/components/next_button.dart';
import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:edu_teens/data/courses.dart';
import 'package:edu_teens/providers/question_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => QuestionStateProvider(),
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
                                  return PageViewPage(question: question);
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
    final index = questionStateProvider.currentQuestionIndex;

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
                icon: const Icon(AppIcons.close),
                iconSize: 14,
                color: AppColors.neutralInverted,
              ),
              AppLabel(
                label: "$points/100",
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
          LayoutBuilder(
            builder: (context, constraints) {
              final totalWidth = constraints.maxWidth;
              final progressWidth =
                  totalWidth * 2 / 10;
              return Stack(
                children: [
                  Container(
                    width: totalWidth,
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppColors.neutralSubOrdinary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Container(
                    width: progressWidth,
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryHard,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              );
            },
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
              questionStateProvider.canNavigate
                  ? () {
                    questionStateProvider.nextQuestion();
                  }
                  : null,

          type: NextButtonType.secondary,
        ),
      ],
    );
  }
}

class PageViewPage extends StatelessWidget {
  final Question question;
  const PageViewPage({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    final questionStateProvider = Provider.of<QuestionStateProvider>(context);

    return AppList(
      vertical: true,
      gap: 16,
      children: [
        AppText(
          question.question,
          size: AppTextSizeType.h4,
          weight: AppTextWeightType.regular,
          color: AppColors.primary_7,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        ...question.options.map((option) {
          return OptionCard(
            option: option,
            isSelected: questionStateProvider.selectedOption == option,
            onTap: () {
              questionStateProvider.selectOption(option);
            },
          );
        }),
      ],
    );
  }
}

class OptionCard extends StatelessWidget {
  final Option option;
  final bool isSelected;
  final void Function() onTap;

  const OptionCard({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: double.infinity,
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary_2 : Colors.black.withAlpha(15),
          borderRadius: BorderRadius.circular(16),
        ),
        child: AppText(option.option, textAlign: TextAlign.center),
      ),
    );
  }
}
