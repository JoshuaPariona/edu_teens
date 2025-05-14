import 'package:edu_teens/consts/app_durations.dart';
import 'package:flutter/material.dart';

class ScrollControllerProvider with ChangeNotifier {
  late final ScrollController _scrollController;
  double _lastOffset = 0;
  double _collapseOffset = 300;
  final double _maxOffset = 300;

  ScrollControllerProvider() {
    _scrollController = ScrollController(
      initialScrollOffset: _lastOffset,
      onAttach: _handelAttach,
    );
    _scrollController.addListener(_handleScroll);
  }

  ScrollController get scrollController => _scrollController;
  double get collapseOffset => _collapseOffset;
  double get maxOffset => _maxOffset;

  void _handleScroll() {
    _lastOffset = _scrollController.offset.clamp(0, _maxOffset);
    if (_lastOffset <= _maxOffset) {
      _collapseOffset = _maxOffset - _lastOffset;
      notifyListeners();
    }
  }

  void _handelAttach(ScrollPosition position) {
    if (_scrollController.hasClients) {
      Future.delayed(Duration.zero, () {
        scrollTo(_lastOffset);
      });
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
