import 'package:edu_teens/consts/app_durations.dart';
import 'package:flutter/material.dart';

class ScrollControllerProvider with ChangeNotifier {
  final ScrollController _scrollController = ScrollController();
  double _collapseOffset = 300;
  final double _maxOffset = 300;

  ScrollControllerProvider() {
    _scrollController.addListener(_handleScroll);
  }

  ScrollController get scrollController => _scrollController;
  double get collapseOffset => _collapseOffset;
  double get maxOffset => _maxOffset;

  void _handleScroll() {
    final double offset = _scrollController.offset.clamp(0, _maxOffset);
    if (offset <= _maxOffset) {
      _collapseOffset = _maxOffset - offset;
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
