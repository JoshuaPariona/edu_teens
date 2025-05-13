//return bound
import 'package:flutter/widgets.dart';

double interpolate({
  double minBound = 0.0,
  required double maxBound,

  double minNumber = 0.0,
  required double maxNumber,
  required double number,}
) {
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
      return SizedBox(
        width: vertical ? 0 : gap,
        height: vertical ? gap : 0,
      );
    } else {
      return builder(i ~/ 2);
    }
  });
}

List<Widget> insertGap(double gap, bool vertical, List<Widget> children) {
  return List.generate(children.length * 2 - 1, (index) {
    if (index.isOdd) {
      return SizedBox(
        width: vertical ? 0 : gap,
        height: vertical ? gap : 0,
      );
    } else {
      return children[index ~/ 2];
    }
  });
}
