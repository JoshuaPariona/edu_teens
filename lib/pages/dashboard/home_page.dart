import 'package:edu_teens/components/app_list.dart';
import 'package:edu_teens/components/app_page.dart';
import 'package:edu_teens/components/app_scroll_list.dart';
import 'package:edu_teens/components/app_section.dart';
import 'package:edu_teens/components/course_progress_card.dart';
import 'package:edu_teens/components/info_card.dart';
import 'package:edu_teens/components/recommendation_card.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      attachScrollController: true,
      children: [
        InfoCard(
          message: "¡Acepta el desafío y demuestra todo tu poder matemático!",
          title: "Comenzar reto",
          onPress: () => print("object"),
        ),
        AppSection(
          title: "Tus avances recientes",
          content: AppScrollList(
            itemCount: 5,
            vertical: false,
            builder:
                (_) => CourseProgressCard(
                  title: "Algebra",
                  percentage: 0.2,
                  type: CourseProgressCardType.secondary,
                  icon: AppIcons.chart,
                ),
          ),
        ),
        AppSection(
          title: "Tus avances recientes",
          onSeeMore: () => print("object"),
          content: AppList(
            vertical: true,
            children: [
              RecommendationCard(
                label: "Geometria",
                labelIcon: AppIcons.calculator,
                message: "¡Casi logras dominar ángulos! Vamos un último repasito",
                type: RecommendationCardType.primary,
              ),
              RecommendationCard(
                label: "Algebra",
                labelIcon: AppIcons.calculator,
                message: "¡A mejorar se ha dicho! Reforzemos polinomios",
                type: RecommendationCardType.secondary,
              ),
              RecommendationCard(
                label: "Trigonometría",
                labelIcon: AppIcons.calculator,
                message: "Cuadrantes necesita más práctica. ¡No lo dejes!",
                type: RecommendationCardType.tertiary,
              )
            ]
          )
        ),
      ],
    );
  }
}
