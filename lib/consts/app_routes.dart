class AppRoutes {
  AppRoutes._();
  static const RouteInfo root = _RouteInfo(p: "/", n: "root");
  static const RouteInfo signup = _RouteInfo(p: "/signup", n: "signup");
  static const RouteInfo signin = _RouteInfo(p: "/signin", n: "signin");
  static const RouteInfo onboarding = _RouteInfo(
    p: "/onboarding",
    n: "onboarding",
  );
  static const RouteInfo dashboard = _RouteInfo(
    p: "/dashboard",
    n: "dashboard",
  );
  static const RouteInfo profile = _RouteInfo(
    p: "/dashboard/profile",
    n: "profile",
  );
  static const RouteInfo home = _RouteInfo(p: "/dashboard/home", n: "home");
  static const RouteInfo progress = _RouteInfo(
    p: "/dashboard/progress",
    n: "progress",
  );
  static const RouteInfo courses = _RouteInfo(
    p: "/dashboard/courses",
    n: "courses",
  );

  static const RouteInfo course = _RouteInfo(p: "/course", n: "course");
  static const RouteInfo questions = _RouteInfo(p: "/questions", n: "questions");

  //in order to use the bottom navigator bar, the routes must be in the same order as the tabs
  static const List<RouteInfo> dashboardTabs = [
    home,
    courses,
    progress,
    profile,
  ];
}

abstract class RouteInfo {
  String get path => throw UnimplementedError();
  String get name => throw UnimplementedError();
}

class _RouteInfo implements RouteInfo {
  final String p;
  final String n;

  const _RouteInfo({required this.p, required this.n});

  @override
  String get name => n;

  @override
  String get path => p;
}
