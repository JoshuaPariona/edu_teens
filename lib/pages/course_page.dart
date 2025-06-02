import 'package:edu_teens/components/app_back_button.dart';
import 'package:edu_teens/components/app_label.dart';
import 'package:edu_teens/components/app_page.dart';
import 'package:edu_teens/components/app_scroll_list.dart';
import 'package:edu_teens/components/app_segmented_button.dart';
import 'package:edu_teens/components/app_text.dart';
import 'package:edu_teens/components/course_overall_progress.dart';
import 'package:edu_teens/components/subject_progress_card.dart';
import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:edu_teens/consts/app_durations.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:edu_teens/data/courses.dart';
import 'package:edu_teens/theme/extensions/app_bar_theme.dart';
import 'package:edu_teens/theme/extensions/app_page_header_theme.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  final PageController pageController = PageController(initialPage: 0);
  CoursePage({super.key});

  void _onPageChanged(int index) {
    pageController.animateToPage(
      index,
      duration: AppDurations.pageTransition,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _CourseAppBar(),
          Expanded(
            child: AppPage(
              scroll: false,
              header: _CourseHeader(title: "Curso de álgebra"),
              children: [
                AppSegmentedButton(
                  items: const [
                    AppSegmentedButtonItem(title: 'Fácil', value: 0),
                    AppSegmentedButtonItem(title: 'Intermedio', value: 1),
                    AppSegmentedButtonItem(title: 'Difícil', value: 2),
                  ],
                  onValueChanged: _onPageChanged,
                ),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                    children: [
                      SubjectsSubPage(pageStorageKey: 'easy'),
                      SubjectsSubPage(pageStorageKey: 'intermediate'),
                      SubjectsSubPage(pageStorageKey: 'hard'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CourseHeader extends StatelessWidget {
  final String title;
  const _CourseHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppPageHeaderTheme>()!;
    return Container(
      color: theme.style.backgroundColor,
      padding: const EdgeInsets.only(
        left: AppDimensions.spaceMedium,
        right: AppDimensions.spaceMedium,
        bottom: AppDimensions.spaceMedium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText(
            title,
            size: AppTextSizeType.h3,
            weight: AppTextWeightType.medium,
            color: theme.style.foregroundColor,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppDimensions.spaceSmall),
          CourseOverallProgress(progress: 0.8),
        ],
      ),
    );
  }
}

class _CourseAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarTheme = theme.extension<AppAppBarTheme>()!.style;

    return Container(
      color: appBarTheme.backgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: appBarTheme.horizontalPadding,
        vertical: appBarTheme.verticalPadding,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBackButton(type: AppBackButtonType.neutral),
          AppLabel(
            label: "Genio",
            type: AppLabelType.tertiary,
            icon: AppIcons.firstPlace,
          ),
        ],
      ),
    );
  }
}

class SubjectsSubPage extends StatelessWidget {
  final String pageStorageKey;
  const SubjectsSubPage({super.key, required this.pageStorageKey});

  @override
  Widget build(BuildContext context) {
    //final scrollControllerProvider =
    //Provider.of<CoursePageScrollControllerProvider>(context);
    return AppScrollList(
      vertical: true,
      padding: 4,
      gap: AppDimensions.spaceLarge,
      key: PageStorageKey(pageStorageKey),
      //controller: scrollControllerProvider.scrollController,
      children:
          courses.first.subjects.map((subject) {
            return SubjectProgressCard(subject: subject);
          }).toList(),
    );
  }
}
