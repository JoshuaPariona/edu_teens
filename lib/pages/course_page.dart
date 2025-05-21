import 'package:edu_teens/components/app_page.dart';
import 'package:edu_teens/components/app_scroll_list.dart';
import 'package:edu_teens/components/app_segmented_button.dart';
import 'package:edu_teens/components/course_app_bar.dart';
import 'package:edu_teens/components/subject_progress_card.dart';
import 'package:edu_teens/consts/app_durations.dart';
import 'package:edu_teens/data/courses.dart';
import 'package:edu_teens/providers/course_page_scroll_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: ChangeNotifierProvider(
        create: (_) => CoursePageScrollControllerProvider(),
        child: Column(
          children: [
            CourseAppBar(title: "Curso de álgebra"),
            Expanded(
              child: AppPage(
                scroll: false,
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
                        PageViewPage(),
                        PageViewPage(),
                        PageViewPage(),
                      ],
                    ),
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

class PageViewPage extends StatelessWidget {
  const PageViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollControllerProvider =
        Provider.of<CoursePageScrollControllerProvider>(context);
    return AppScrollList(
      vertical: true,
      gap: 24,
      controller: scrollControllerProvider.scrollController,
      children: courses.first.subjects.map((subject) {
        return SubjectProgressCard(
          subject: subject,
        );
      }).toList(),
    );
  }
}
