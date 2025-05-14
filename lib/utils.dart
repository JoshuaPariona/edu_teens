import 'package:flutter/widgets.dart';
import 'dart:math';
import 'package:flutter/rendering.dart';

double interpolate({
  double minBound = 0.0,
  required double maxBound,

  double minNumber = 0.0,
  required double maxNumber,
  required double number,
}) {
  final clamped = number.clamp(minNumber, maxNumber);
  final t = (clamped - minNumber) / (maxNumber - minNumber);
  return minBound + (maxBound - minBound) * t;
}

List<Widget> buildWidgetArray(int count, Widget Function(int) builder) {
  List<Widget> list = [];
  for (var i = 0; i < count; i++) {
    list.add(builder(i));
  }
  return list;
}

List<Widget> buildWidgetArrayWithGap(
  int count,
  double gap,
  bool vertical,
  Widget Function(int) builder,
) {
  return List.generate(count * 2 - 1, (i) {
    if (i.isOdd) {
      return SizedBox(width: vertical ? 0 : gap, height: vertical ? gap : 0);
    } else {
      return builder(i ~/ 2);
    }
  });
}

List<Widget> insertGap(double gap, bool vertical, List<Widget> children) {
  return List.generate(children.length * 2 - 1, (index) {
    if (index.isOdd) {
      return SizedBox(width: vertical ? 0 : gap, height: vertical ? gap : 0);
    } else {
      return children[index ~/ 2];
    }
  });
}

class SliverGridWithCustomGeometryLayout extends SliverGridRegularTileLayout {
  /// The builder for each child geometry.
  final SliverGridGeometry Function(
    int index,
    SliverGridRegularTileLayout layout,
  )
  geometryBuilder;

  SliverGridWithCustomGeometryLayout({
    required this.geometryBuilder,
    required int crossAxisCount,
    required double mainAxisStride,
    required double crossAxisStride,
    required double childMainAxisExtent,
    required double childCrossAxisExtent,
    required bool reverseCrossAxis,
  }) : 
       assert(crossAxisCount > 0),
       assert(mainAxisStride >= 0),
       assert(crossAxisStride >= 0),
       assert(childMainAxisExtent >= 0),
       assert(childCrossAxisExtent >= 0),
       super(
         crossAxisCount: crossAxisCount,
         mainAxisStride: mainAxisStride,
         crossAxisStride: crossAxisStride,
         childMainAxisExtent: childMainAxisExtent,
         childCrossAxisExtent: childCrossAxisExtent,
         reverseCrossAxis: reverseCrossAxis,
       );

  @override
  SliverGridGeometry getGeometryForChildIndex(int index) {
    return geometryBuilder(index, this);
  }
}

/// Creates grid layouts with a fixed number of tiles in the cross axis, such
/// that fhe last element, if the grid item count is odd, is centralized.
class SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement
    extends SliverGridDelegateWithFixedCrossAxisCount {
  /// The total number of itens in the layout.
  final int itemCount;

  SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement({
    required this.itemCount,
    required int crossAxisCount,
    double mainAxisSpacing = 0.0,
    double crossAxisSpacing = 0.0,
    double childAspectRatio = 1.0,
  }) : assert(itemCount > 0),
       assert(crossAxisCount > 0),
       assert(mainAxisSpacing >= 0),
       assert(crossAxisSpacing >= 0),
       assert(childAspectRatio > 0),
       super(
         crossAxisCount: crossAxisCount,
         mainAxisSpacing: mainAxisSpacing,
         crossAxisSpacing: crossAxisSpacing,
         childAspectRatio: childAspectRatio,
       );

  bool _debugAssertIsValid() {
    assert(crossAxisCount > 0);
    assert(mainAxisSpacing >= 0.0);
    assert(crossAxisSpacing >= 0.0);
    assert(childAspectRatio > 0.0);
    return true;
  }

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    assert(_debugAssertIsValid());
    final usableCrossAxisExtent = max(
      0.0,
      constraints.crossAxisExtent - crossAxisSpacing * (crossAxisCount - 1),
    );
    final childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
    final childMainAxisExtent = childCrossAxisExtent / childAspectRatio;
    return SliverGridWithCustomGeometryLayout(
      geometryBuilder: (index, layout) {
        return SliverGridGeometry(
          scrollOffset: (index ~/ crossAxisCount) * layout.mainAxisStride,
          crossAxisOffset:
              itemCount.isOdd && index == itemCount - 1
                  ? layout.crossAxisStride / 2
                  : _getOffsetFromStartInCrossAxis(index, layout),
          mainAxisExtent: childMainAxisExtent,
          crossAxisExtent: childCrossAxisExtent,
        );
      },
      crossAxisCount: crossAxisCount,
      mainAxisStride: childMainAxisExtent + mainAxisSpacing,
      crossAxisStride: childCrossAxisExtent + crossAxisSpacing,
      childMainAxisExtent: childMainAxisExtent,
      childCrossAxisExtent: childCrossAxisExtent,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  double _getOffsetFromStartInCrossAxis(
    int index,
    SliverGridRegularTileLayout layout,
  ) {
    final crossAxisStart = (index % crossAxisCount) * layout.crossAxisStride;

    if (layout.reverseCrossAxis) {
      return crossAxisCount * layout.crossAxisStride -
          crossAxisStart -
          layout.childCrossAxisExtent -
          (layout.crossAxisStride - layout.childCrossAxisExtent);
    }
    return crossAxisStart;
  }
}
