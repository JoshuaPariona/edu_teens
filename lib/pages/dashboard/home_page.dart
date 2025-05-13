import 'package:edu_teens/components/app_page.dart';
import 'package:edu_teens/components/app_scroll_list.dart';
import 'package:edu_teens/components/app_section.dart';
import 'package:edu_teens/components/course_progress_card.dart';
import 'package:edu_teens/components/info_card.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:edu_teens/utils.dart';
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
        ),
        AppSection(
          title: "Tus avances recientes",
          onSeeMore: () => print("object"),
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
        ...buildWidgetArray(
          30,
          (n) => Padding(padding: EdgeInsets.all(20), child: Text("data")),
        ),
      ],
    );
  }
}
