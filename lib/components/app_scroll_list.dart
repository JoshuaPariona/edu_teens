import 'package:edu_teens/consts/app_dimensions.dart';
import 'package:edu_teens/utils.dart';
import 'package:flutter/material.dart';

class AppScrollList extends StatelessWidget {
  final List<Widget>? children;
  final bool vertical;
  final double gap;
  final int? itemCount;
  final double padding;
  final Widget Function(int)? builder;
  final ScrollController? controller;
  final String? pageStorageKey;

  const AppScrollList({
    super.key,
    this.pageStorageKey,
    this.children,
    this.vertical = false,
    this.gap = AppDimensions.spaceMedium,
    this.padding = 0,
    this.itemCount,
    this.builder,
    this.controller,
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
      scrollDirection: axis,
      controller: controller,
      key:
          pageStorageKey != null
              ? PageStorageKey<String>(pageStorageKey!)
              : null,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: vertical ? Column(children: widgets) : Row(children: widgets),
      ),
    );
  }
}
