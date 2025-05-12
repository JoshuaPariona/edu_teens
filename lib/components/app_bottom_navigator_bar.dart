import 'package:edu_teens/consts/app_durations.dart';
import 'package:edu_teens/consts/app_icons.dart';
import 'package:edu_teens/consts/app_routes.dart';
import 'package:edu_teens/theme/extensions/bottom_nav_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class AppBottomNavigatorBar extends StatefulWidget {
  const AppBottomNavigatorBar({super.key});

  @override
  State<AppBottomNavigatorBar> createState() => _AppBottomNavigatorBarState();
}

class _AppBottomNavigatorBarState extends State<AppBottomNavigatorBar>
    with SingleTickerProviderStateMixin {
  late int selectedIndex;
  late AnimationController _controller;
  late Animation<double> _animation;

  bool isTabsDisabled = false;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.pageTransition,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void _onTap(int index) {
    if (index != selectedIndex) {
      _controller.forward(from: 0);
      setState(() {
        selectedIndex = index;
        isTabsDisabled = true;
      });
      context.go(AppRoutes.dashboardTabs[index].path);
      Future.delayed(
        AppDurations.pageTransition,
        () => setState(() {
          isTabsDisabled = false;
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BottomNavTheme>()!;
    final location = GoRouterState.of(context).uri.toString();
    final index = AppRoutes.dashboardTabs.indexWhere(
      (route) => location.startsWith(route.path),
    );
    selectedIndex = index >= 0 ? index : 0;
    final indicatorWidth = theme.style.indicatorWidth;
    final indicatorHeight = theme.style.indicatorHeight;
    final indicatorTop = theme.style.verticalPadding;

    return LayoutBuilder(
      builder: (context, constraints) {
        final tabSectionWidth =
            constraints.maxWidth / AppRoutes.dashboardTabs.length;
        return Container(
          color: theme.style.backgroundColor,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: theme.style.transitionDuration,
                curve: Curves.easeInOut,
                left:
                    tabSectionWidth * selectedIndex +
                    tabSectionWidth / 2 -
                    indicatorWidth / 2,
                top: indicatorTop,
                child: Container(
                  width: indicatorWidth,
                  height: indicatorHeight,
                  decoration: BoxDecoration(
                    color: theme.style.indicatorColor,
                    borderRadius: theme.style.borderRadius,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(AppRoutes.dashboardTabs.length, (i) {
                  final isSelected = i == selectedIndex;
                  return GestureDetector(
                    onTap: isTabsDisabled ? null : () => _onTap(i),
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      width: tabSectionWidth,
                      padding: EdgeInsets.all(theme.style.verticalPadding),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: theme.style.iconVerticalPadding,
                            ),
                            child: Icon(
                              [
                                AppIcons.home,
                                AppIcons.understood,
                                AppIcons.chart,
                                AppIcons.user,
                              ][i],
                              size: theme.style.iconTabSize,
                              color:
                                  isSelected
                                      ? theme.style.activeIconTabColor
                                      : theme.style.iconTabColor,
                            ),
                          ),
                          SizedBox(height: theme.style.verticalGap),
                          Text(
                            ["Inicio", "Cursos", "Progreso", "Mi perfil"][i],
                            style: TextStyle(
                              fontSize: theme.style.labelSize,
                              color:
                                  isSelected
                                      ? theme.style.activeLabelColor
                                      : theme.style.labelColor,
                              fontWeight: theme.style.labelFontWeight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
