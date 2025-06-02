import 'package:edu_teens/components/app_list.dart';
import 'package:edu_teens/components/app_page.dart';
import 'package:edu_teens/components/app_scroll_list.dart';
import 'package:edu_teens/components/app_section.dart';
import 'package:edu_teens/components/course_progress_card.dart';
import 'package:edu_teens/components/info_card.dart';
import 'package:edu_teens/components/recommendation_card.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:edu_teens/data/courses.dart';
import 'package:edu_teens/providers/home_scroll_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeScrollControllerProvider =
        Provider.of<HomeScrollControllerProvider>(context);

    return AppPage(
      //scrollController: homeScrollControllerProvider.scrollController,
      pageStorageKey: "home_page",
      children: [
        InfoCard(
          message: "¡Acepta el desafío y demuestra todo tu poder matemático!",
          title: "Comenzar reto",
          onPress: () => print("object"),
        ),
        AppSection(
          title: "Tus avances recientes",
          content: AppScrollList(
            vertical: false,
            padding: 4,
            pageStorageKey: "home_page_progress",
            children:
                courses.map((course) {
                  return CourseProgressCard(
                    onTap: () => print("object"),
                    title: course.name,
                    percentage: course.progress,
                    type: CourseProgressCardType.values.firstWhere(
                      (type) => type.name == course.type,
                    ),
                    icon: AppIcons.getIcon(course.icon),
                  );
                }).toList(),
          ),
        ),
        AppSection(
          title: "Recomendaciones para ti",
          onSeeMore: () => print("object"),
          content: AppList(
            vertical: true,
            children: [
              RecommendationCard(
                label: "Geometria",
                labelIcon: AppIcons.cone,
                message:
                    "¡Casi logras dominar ángulos! Vamos un último repasito",
                type: RecommendationCardType.primary,
              ),
              RecommendationCard(
                label: "Algebra",
                labelIcon: AppIcons.formula,
                message: "¡A mejorar se ha dicho! Reforzemos polinomios",
                type: RecommendationCardType.secondary,
              ),
              RecommendationCard(
                label: "Trigonometría",
                labelIcon: AppIcons.calculator,
                message: "Cuadrantes necesita más práctica. ¡No lo dejes!",
                type: RecommendationCardType.tertiary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
