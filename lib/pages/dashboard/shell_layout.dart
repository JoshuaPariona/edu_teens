import 'package:edu_teens/components/app_app_bar.dart';
import 'package:edu_teens/consts/app_durations.dart';
import 'package:edu_teens/pages/dashboard/courses_page.dart';
import 'package:edu_teens/pages/dashboard/home_page.dart';
import 'package:edu_teens/pages/dashboard/profile_page.dart';
import 'package:edu_teens/pages/dashboard/progress_page.dart';
import 'package:flutter/material.dart';
import 'package:edu_teens/components/app_bottom_navigator_bar.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;
  final int currentIndex;
  const DashboardLayout({
    super.key,
    required this.child,
    required this.currentIndex,
  });
  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentIndex);
  }

  @override
  void didUpdateWidget(covariant DashboardLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    _pageController.animateToPage(
      widget.currentIndex,
      duration: AppDurations.pageTransition,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          AppAppBar(currentIndex: widget.currentIndex),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                HomePage(),
                CoursesPage(),
                ProgressPage(),
                ProfilePage(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNavigatorBar(
        currentIndex: widget.currentIndex,
      ),
    );
  }
}
