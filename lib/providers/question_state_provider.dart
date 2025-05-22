import 'package:edu_teens/data/courses.dart';
import 'package:flutter/material.dart';
import 'package:edu_teens/consts/app_durations.dart';

class QuestionStateProvider with ChangeNotifier {
  final PageController _pageController = PageController(initialPage: 0);
  final int questionCount;
  final int _correctPoints = 20;
  final int _incorrectPoints = -5;
  late final int _maxPoints;

  int _points = 0;
  int _currentQuestionIndex = 0;
  bool _testComplete = false;

  //must reset in each question
  bool _completed = false;
  Option? _selectedOption;
  bool _hasValidated = false;
  bool? _validatedIsCorrect;

  int get currentQuestionIndex => _currentQuestionIndex;
  int get points => _points;
  int get maxPoints => _maxPoints;
  PageController get pageController => _pageController;
  Option? get selectedOption => _selectedOption;
  bool get completed => _completed;
  bool get hasValidated => _hasValidated;
  bool? get validatedIsCorrect => _validatedIsCorrect;
  bool get testComplete => _testComplete;

  QuestionStateProvider({required this.questionCount}) {
    _maxPoints = questionCount * _correctPoints;
  }

  void reset() {
    _completed = false;
    _selectedOption = null;
    _hasValidated = false;
    _validatedIsCorrect = null;
    _currentQuestionIndex = _pageController.page?.round() ?? 0;
    if (_currentQuestionIndex >= questionCount - 1) {
      _testComplete = true;
    } else {
      _testComplete = false;
    }
    notifyListeners();
  }

  void badResponse() {
    _points += _incorrectPoints;
    _validatedIsCorrect = false;
    notifyListeners();
  }

  void correctResponse() {
    _points += _correctPoints;
    _validatedIsCorrect = true;
    notifyListeners();
  }

  void nextQuestion() {
    if (!_completed) return;
    if (_currentQuestionIndex >= questionCount - 1) return;

    _pageController
        .nextPage(
          duration: AppDurations.pageTransition,
          curve: Curves.easeInOut,
        )
        .then((_) {
          reset();
        });
  }

  void selectOption(Option option) {
    if (_completed) return;
    _selectedOption = option;
    notifyListeners();
  }

  void validateSelectedOption() {
    if (_completed) return;
    if (_selectedOption == null) return;
    _hasValidated = true;
    if (_selectedOption!.isCorrect) {
      correctResponse();
    } else {
      badResponse();
    }
    _completed = true;
    notifyListeners();
  }
}
