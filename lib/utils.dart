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