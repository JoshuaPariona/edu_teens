import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:edu_teens/utils.dart';
import 'package:flutter/material.dart';

class AppScrollList extends StatelessWidget {
  final List<Widget>? children;
  final bool vertical;
  final double gap;
  final int? itemCount;
  final Widget Function(int)? builder;

  const AppScrollList({
    super.key,
    this.children,
    this.vertical = false,
    this.gap = AppDimensions.spaceMedium,
    this.itemCount,
    this.builder,
  }) : assert(
         (children != null && builder == null && itemCount == null) ||
             (children == null && builder != null && itemCount != null),
         'Provide either children or builder + itemCount',
       );

  @override
  Widget build(BuildContext context) {
    final axis = vertical ? Axis.vertical : Axis.horizontal;

    final widgets =
        children != null
            ? insertGap(gap, vertical, children!)
            : buildWidgetArrayWithGap(itemCount!, gap, vertical, builder!);

    return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: axis,
      child: vertical ? Column(children: widgets) : Row(children: widgets),
    );
  }
}
