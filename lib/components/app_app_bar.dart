import 'dart:async';

import 'package:edu_teens/components/app_input.dart';
import 'package:edu_teens/components/app_label.dart';
import 'package:edu_teens/components/app_text.dart';
import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:edu_teens/consts/app_images.dart';
import 'package:edu_teens/consts/app_routes.dart';
import 'package:edu_teens/providers/scroll_controller_provider.dart';
import 'package:edu_teens/theme/extensions/app_bar_theme.dart';
import 'package:edu_teens/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppAppBar extends StatefulWidget {
  const AppAppBar({super.key});

  @override
  State<AppAppBar> createState() => _AppAppBarState();
}

class _AppAppBarState extends State<AppAppBar> with RouteAware {

  Widget _buildAnimatedImage(bool isCourses) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
      right: 0,
      bottom: isCourses ? 0 : -150,
      child: IgnorePointer(
        child: Image.asset(AppImages.eduSearch),
      ),
    );
  }

  Widget _buildCoursesTitle(ThemeData theme) {
    return AppText(
      "Cursos",
      size: AppTextSizeType.h3,
      weight: AppTextWeightType.medium,
      color: theme.extension<AppAppBarTheme>()!.style.foregroundColor,
    );
  }

  Widget _buildHomeContent(ThemeData theme, double height, double opacity) {
    final appBarTheme = theme.extension<AppAppBarTheme>()!.style;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(
              backgroundColor: appBarTheme.foregroundColor,
              radius: appBarTheme.leadingSize,
              child: Image.asset(AppImages.avatar),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppLabel(
                  label: "12500 puntos",
                  type: AppLabelType.primary,
                  icon: AppIcons.money,
                  filled: false,
                  cancellable: true,
                ),
                SizedBox(width: appBarTheme.actionsGap),
                Stack(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        AppIcons.notification,
                        color: appBarTheme.foregroundColor,
                      ),
                      onPressed: () => print("notification"),
                    ),
                    Positioned(
                      top: AppDimensions.appIconSize / 5,
                      right: AppDimensions.appIconSize / 5,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: AppColors.error,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: AppText(
                            "1",
                            size: AppTextSizeType.footnote,
                            weight: AppTextWeightType.medium,
                            color: appBarTheme.foregroundColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: height,
          child: Opacity(
            opacity: opacity,
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: appBarTheme.verticalGap),
                  AppText(
                    "¡Bienvenida, Valery! ",
                    size: AppTextSizeType.h4,
                    weight: AppTextWeightType.medium,
                    color: appBarTheme.foregroundColor,
                  ),
                  SizedBox(height: appBarTheme.verticalFlexibleSpaceGap),
                  AppText(
                    "¿Lista para romperla con las mates hoy?",
                    size: AppTextSizeType.subtitle,
                    weight: AppTextWeightType.regular,
                    color: appBarTheme.foregroundColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final scrollControllerProvider = context.watch<ScrollControllerProvider>();
    final theme = Theme.of(context);
    final appBarTheme = theme.extension<AppAppBarTheme>()!.style;
    final location = GoRouter.of(context).state.name;

    final isHome = location == AppRoutes.home.name;
    final isCourses = location == AppRoutes.courses.name;

    double height = interpolate(
      maxBound: appBarTheme.flexibleSpaceExpandedHeight,
      maxNumber: scrollControllerProvider.maxOffset,
      number: scrollControllerProvider.collapseOffset,
    );

    double opacity = interpolate(
      maxBound: 1,
      maxNumber: scrollControllerProvider.maxOffset,
      number: scrollControllerProvider.collapseOffset,
    );

    return Stack(
      children: [
        Container(
          color: appBarTheme.backgroundColor,
          padding: EdgeInsets.symmetric(
            horizontal: appBarTheme.horizontalPadding,
            vertical: appBarTheme.verticalPadding,
          ),
          child: Column(
            children: [
              if (isCourses) _buildCoursesTitle(theme),
              if (isHome) _buildHomeContent(theme, height, opacity),
              if (isCourses)
                SizedBox(height: appBarTheme.verticalGap),
              if (isCourses) AppInput(placeHolder: "Buscar cursos o temas"),
            ],
          ),
        ),
        _buildAnimatedImage(isCourses),
      ],
    );
  }
}
