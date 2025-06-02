import 'dart:async';

import 'package:edu_teens/components/app_label.dart';
import 'package:edu_teens/components/app_text.dart';
import 'package:edu_teens/consts/app_colors.dart';
import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:edu_teens/consts/app_images.dart';
import 'package:edu_teens/consts/app_routes.dart';
import 'package:edu_teens/theme/extensions/app_bar_theme.dart';
import 'package:flutter/material.dart';

class AppAppBar extends StatefulWidget {
  final int currentIndex;
  const AppAppBar({super.key, required this.currentIndex});

  @override
  State<AppAppBar> createState() => _AppAppBarState();
}

class _AppAppBarState extends State<AppAppBar> {
  double bottom = -150;
  final List<Timer> _timers = [];

  Widget _buildAnimatedImage(bool isCourses) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
      right: 0,
      bottom: isCourses ? bottom : -150,
      child: IgnorePointer(child: Image.asset(AppImages.eduSearch)),
    );
  }

  void _eduSearchAnimation() {
    for (final timer in _timers) {
      timer.cancel();
    }
    final showTimer = Timer(Duration(milliseconds: 200), () {
      if (!mounted) return;
      setState(() => bottom = 0);

      final hideTimer = Timer(Duration(milliseconds: 2000), () {
        if (!mounted) return;
        setState(() => bottom = -150);
      });

      _timers.add(hideTimer);
    });

    _timers.add(showTimer);
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    _eduSearchAnimation();
  }

  @override
  void dispose() {
    for (final timer in _timers) {
      timer.cancel();
    }
    _timers.clear();
    super.dispose();
  }

  Widget _buildHomeContent(AppAppBarTheme theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        CircleAvatar(
          backgroundColor: theme.style.foregroundColor,
          radius: theme.style.leadingSize,
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
            ),
            SizedBox(width: theme.style.actionsGap),
            Stack(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    AppIcons.notification,
                    color: theme.style.foregroundColor,
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
                        color: theme.style.foregroundColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVCoursesContent(AppAppBarTheme theme) {
    return Center(
      child: AppText(
        "Cursos",
        size: AppTextSizeType.h3,
        weight: AppTextWeightType.medium,
        color: theme.style.foregroundColor,
      ),
    );
  }

  Widget _selectAppBarContent(AppAppBarTheme theme) {
    final route = AppRoutes.dashboardTabs[widget.currentIndex];
    switch (route) {
      case AppRoutes.home:
        return _buildHomeContent(theme);
      case AppRoutes.courses:
        return _buildVCoursesContent(theme);
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppAppBarTheme>()!;

    /*
    double height = interpolate(
      maxBound: theme.style.flexibleSpaceExpandedHeight,
      maxNumber: scrollControllerProvider.maxOffset,
      number: scrollControllerProvider.collapseOffset,
    );

    double opacity = interpolate(
      maxBound: 1,
      maxNumber: scrollControllerProvider.maxOffset,
      number: scrollControllerProvider.collapseOffset,
    );
     */

    return Container(
      color: theme.style.backgroundColor,
      width: double.infinity,
      height:
          AppDimensions.appBarContentHeight + (2 * AppDimensions.spaceMedium),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.spaceMedium,
        vertical: AppDimensions.spaceMedium,
      ),
      child: _selectAppBarContent(theme),
    );
  }
}
