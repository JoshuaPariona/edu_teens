import 'package:edu_teens/components/app_app_bar.dart';
import 'package:edu_teens/providers/scroll_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:edu_teens/components/app_bottom_navigator_bar.dart';
import 'package:provider/provider.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;
  const DashboardLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ScrollControllerProvider(),
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [AppAppBar(), Expanded(child: child)]),
        bottomNavigationBar: AppBottomNavigatorBar(),
      ),
    );
  }
}
