import 'package:edu_teens/consts/app_durations.dart';
import 'package:edu_teens/consts/app_routes.dart';
import 'package:edu_teens/pages/pages.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();
  static RouteInfo dashboardCurrentRouteInfo = AppRoutes.home;

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.signin.path,
    routes: [
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
        path: AppRoutes.dashboard.path,
        name: AppRoutes.dashboard.name,
        builder: (context, state) => const Placeholder(),
        redirect: (context, state) {
          return dashboardCurrentRouteInfo.path;
        },
      ),
      ShellRoute(
        builder: (context, state, child) {
          return DashboardLayout(child: child);
        },
        routes: [
          GoRoute(
            path: AppRoutes.home.path,
            name: AppRoutes.home.name,
            pageBuilder:
                (context, state) => CustomTransitionPage(
                  transitionDuration: AppDurations.pageTransition,
                  reverseTransitionDuration: AppDurations.pageTransition,
                  key: state.pageKey,
                  child: HomePage(),
                  transitionsBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ) {
                    dashboardCurrentRouteInfo = AppRoutes.home;
                    return SlideTransition(
                      position: animation.drive(
                        Tween(begin: Offset(1, 0), end: Offset.zero),
                      ),
                      child: child,
                    );
                  },
                ),
          ),
          GoRoute(
            path: AppRoutes.assignments.path,
            name: AppRoutes.assignments.name,
            pageBuilder:
                (context, state) => CustomTransitionPage(
                  transitionDuration: AppDurations.pageTransition,
                  reverseTransitionDuration: AppDurations.pageTransition,
                  key: state.pageKey,
                  child: AssignmentsPage(),
                  transitionsBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ) {
                    dashboardCurrentRouteInfo = AppRoutes.assignments;
                    return SlideTransition(
                      position: animation.drive(
                        Tween(begin: Offset(1, 0), end: Offset.zero),
                      ),
                      child: child,
                    );
                  },
                ),
          ),
          GoRoute(
            path: AppRoutes.progress.path,
            name: AppRoutes.progress.name,
            pageBuilder:
                (context, state) => CustomTransitionPage(
                  transitionDuration: AppDurations.pageTransition,
                  reverseTransitionDuration: AppDurations.pageTransition,
                  key: state.pageKey,
                  child: ProgressPage(),
                  transitionsBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ) {
                    dashboardCurrentRouteInfo = AppRoutes.progress;
                    return SlideTransition(
                      position: animation.drive(
                        Tween(begin: Offset(1, 0), end: Offset.zero),
                      ),
                      child: child,
                    );
                  },
                ),
          ),
          GoRoute(
            path: AppRoutes.profile.path,
            name: AppRoutes.profile.name,
            pageBuilder:
                (context, state) => CustomTransitionPage(
                  transitionDuration: AppDurations.pageTransition,
                  reverseTransitionDuration: AppDurations.pageTransition,
                  key: state.pageKey,
                  child: ProfilePage(),
                  transitionsBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ) {
                    dashboardCurrentRouteInfo = AppRoutes.profile;
                    return SlideTransition(
                      position: animation.drive(
                        Tween(begin: Offset(1, 0), end: Offset.zero),
                      ),
                      child: child,
                    );
                  },
                ),
          ),
        ],
      ),
      GoRoute(path: '/test_ui', builder: (context, state) => UiTest()),
    ],
  );
}
