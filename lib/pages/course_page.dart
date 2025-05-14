import 'package:edu_teens/components/course_app_bar.dart';
import 'package:edu_teens/providers/course_page_scroll_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => CoursePageScrollControllerProvider(),
        child: Column(
          children: [
            CourseAppBar(title: "Curso de álgebra"),
            Expanded(child: Placeholder()),
            /*
            AppPage(children: [
                  AppSegmentedButton(
                    items: const [
                      AppSegmentedControlItem(
                        title: 'Fácil',
                        value: 0,
                      ),
                      AppSegmentedControlItem(
                        title: 'Intermedio',
                        value: 1,
                      ),
                      AppSegmentedControlItem(
                        title: 'Difícil',
                        value: 1,
                      ),
                    ],
                    onValueChanged: (value) {},
                  ),
                  PageView(
                    children: [
                      Course(
                        title: 'Matemáticas',
                        description: 'Aprende matemáticas de una manera divertida',
                        image: AppImages.eduAlgebra,
                        onTap: () {},
                      ),
                      CourseCard(
                        title: 'Ciencias',
                        description: 'Explora el mundo de las ciencias',
                        image: AppImages.eduRM,
                        onTap: () {},
                      ),
                      CourseCard(
                        title: 'Historia',
                        description: 'Conoce la historia de una manera diferente',
                        image: AppImages.eduSurprise,
                        onTap: () {},
                      ),
                    ],
                  ),
        ]))
            */
          ],
        ),
      ),
    );
  }
}
