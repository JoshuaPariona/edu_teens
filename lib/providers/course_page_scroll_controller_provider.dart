import 'package:edu_teens/consts/app_durations.dart';
import 'package:flutter/material.dart';

class CoursePageScrollControllerProvider with ChangeNotifier {
  final ScrollController _scrollController = ScrollController();
  double _lastOffset = 0;
  bool _collapse = false;

  CoursePageScrollControllerProvider() {
    _scrollController.addListener(_handleScroll);
  }

  ScrollController get scrollController => _scrollController;
  bool get collapse => _collapse;

  void _handleScroll() {
    _lastOffset = _scrollController.offset;
    if (_lastOffset > 0) {
      _collapse = true;
      notifyListeners();
    } else {
      _collapse = false;
      notifyListeners();
    }
  }

  void scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: AppDurations.scrollAnimation,
      curve: Curves.easeInOut,
    );
  }

  void scrollTo(double offset) {
    _scrollController.animateTo(
      offset,
      duration: AppDurations.scrollAnimation,
      curve: Curves.easeInOut,
    );
  }

  void scrollToBottom() {
    final max = _scrollController.position.maxScrollExtent;
    _scrollController.animateTo(
      max,
      duration: AppDurations.scrollAnimation,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }
}
