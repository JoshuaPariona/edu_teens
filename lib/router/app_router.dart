import 'package:edu_teens/consts/app_routes.dart';
import 'package:edu_teens/pages/pages.dart';
import 'package:edu_teens/pages/questions_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static int dashboardCurrentIndex = 0;

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.home.path,
    routes: [
      GoRoute(
        path: AppRoutes.root.path,
        name: AppRoutes.root.name,
        builder: (context, state) => const Placeholder(),
        redirect: (context, state) {
          return AppRoutes.dashboardTabs[dashboardCurrentIndex].path;
        },
      ),
      GoRoute(
        path: AppRoutes.login.path,
        name: AppRoutes.login.name,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.signin.path,
        name: AppRoutes.signin.name,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: AppRoutes.onboarding.path,
        name: AppRoutes.onboarding.name,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: AppRoutes.course.path,
        name: AppRoutes.course.name,
        builder: (context, state) => CoursePage(),
      ),
      GoRoute(
        path: AppRoutes.questions.path,
        name: AppRoutes.questions.name,
        builder: (context, state) => QuestionsPage(),
      ),
      GoRoute(
        path: AppRoutes.dashboard.path,
        name: AppRoutes.dashboard.name,
        builder: (context, state) => const Placeholder(),
        redirect: (context, state) {
          return AppRoutes.dashboardTabs[dashboardCurrentIndex].path;
        },
      ),
      ShellRoute(
        builder: (context, state, child) {
          final name = state.topRoute!.name;
          final index = AppRoutes.dashboardTabs.indexWhere(
            (route) => route.name == name,
          );
          if (index != -1) {
            AppRouter.dashboardCurrentIndex = index;
          }
          return DashboardLayout(
            currentIndex: dashboardCurrentIndex,
            child: child,
          );
        },
        routes:
            AppRoutes.dashboardTabs
                .map(
                  (route) => GoRoute(
                    path: route.path,
                    name: route.name,
                    builder: (context, state) => Placeholder(),
                  ),
                )
                .toList(),
      ),
      GoRoute(path: '/test_ui', builder: (context, state) => UiTest()),
    ],
  );
}
