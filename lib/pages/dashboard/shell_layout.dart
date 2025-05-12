import 'package:flutter/material.dart';
import 'package:edu_teens/components/app_bottom_navigator_bar.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;

  const DashboardLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: BottomNav(), body: child);
  }
}
