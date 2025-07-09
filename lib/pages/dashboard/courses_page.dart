import 'package:edu_teens/components/app_input.dart';
import 'package:edu_teens/components/app_page.dart';
import 'package:edu_teens/components/course_card.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:edu_teens/consts/app_routes.dart';
import 'package:edu_teens/data/courses.dart';
import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:edu_teens/theme/extensions/app_page_header_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      pageStorageKey: "courses_page",
      gridView: true,
      header: _CoursesPageHeader(),
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

class _CoursesPageHeader extends StatefulWidget {
  @override
  State<_CoursesPageHeader> createState() => __CoursesPageHeaderState();
}

class __CoursesPageHeaderState extends State<_CoursesPageHeader> {
  final FocusNode _focusNode = FocusNode();

  bool _handleTextChange(String text) {
    return false;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

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
      child: AppInput(
        placeHolder: "Buscar cursos o temas",
        label: "Curso",
        focusNode: _focusNode,
        onTextChange: _handleTextChange,
      ),
    );
  }
}
