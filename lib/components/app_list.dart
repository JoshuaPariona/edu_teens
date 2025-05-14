import 'package:flutter/material.dart';
import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:edu_teens/utils.dart';

class AppList extends StatelessWidget {
  final List<Widget> children;
  final bool vertical;
  final double gap;
  const AppList({super.key, required this.children, required this.vertical, this.gap = AppDimensions.spaceMedium});

  @override
  Widget build(BuildContext context) {
    final widgets = insertGap(gap, vertical, children);
    return vertical ? Column(children: widgets) : Row(children: widgets);
  }
}