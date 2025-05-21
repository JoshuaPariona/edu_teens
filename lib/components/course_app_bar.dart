import 'package:edu_teens/components/app_back_button.dart';
import 'package:edu_teens/components/app_label.dart';
import 'package:edu_teens/components/app_text.dart';
import 'package:edu_teens/components/course_overall_progress.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:edu_teens/providers/course_page_scroll_controller_provider.dart';
import 'package:edu_teens/theme/extensions/app_bar_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseAppBar extends StatefulWidget {
  final String title;
  const CourseAppBar({super.key, required this.title});

  @override
  State<CourseAppBar> createState() => _CourseAppBarState();
}

class _CourseAppBarState extends State<CourseAppBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarTheme = theme.extension<AppAppBarTheme>()!.style;
    final scrollControllerProvider =
        context.watch<CoursePageScrollControllerProvider>();

    return Container(
      color: appBarTheme.backgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: appBarTheme.horizontalPadding,
        vertical: appBarTheme.verticalPadding,
      ),
      child: Column(
        children: [
          Row(
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
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            height: scrollControllerProvider.collapse ? 0 : 200,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 400),
              opacity: scrollControllerProvider.collapse ? 0 : 1,
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: appBarTheme.verticalGap),
                    AppText(
                      widget.title,
                      size: AppTextSizeType.h3,
                      weight: AppTextWeightType.medium,
                      color: appBarTheme.foregroundColor,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: appBarTheme.verticalFlexibleSpaceGap),
                    CourseOverallProgress(progress: 0.8),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
