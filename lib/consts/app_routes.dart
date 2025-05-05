class AppRoutes {
  AppRoutes._();
  static const RouteInfo login = _RouteInfo(p: "/login", n: "login");
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
  static const RouteInfo assignments = _RouteInfo(
    p: "/dashboard/assignments",
    n: "assignments",
  );
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
