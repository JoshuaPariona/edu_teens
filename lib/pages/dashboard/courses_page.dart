import 'package:edu_teens/components/app_page.dart';
import 'package:edu_teens/components/course_card.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:edu_teens/consts/app_routes.dart';
import 'package:edu_teens/data/courses.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      gridView: true,
      children:
          courses.map((course) {
            return CourseCard(
              onTap: () => context.pushNamed(AppRoutes.course.name),
              title: course.name,
              type: CourseCardType.values.firstWhere(
                (type) => type.name == course.type,
              ),
              icon: AppIcons.getIcon(course.icon),
            );
          }).toList(),
    );
  }
}
