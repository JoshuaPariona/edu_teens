import 'package:edu_teens/data/courses.dart';
import 'package:flutter/material.dart';

class QuestionStateProvider with ChangeNotifier {
  final PageController pageController = PageController(initialPage: 0);
  double _points = 0;
  int _currentQuestionIndex = 1;
  int _questionCount = 10;
  Option? _selectedOption;
  bool _canNavigate = false;

  int get currentQuestionIndex => _currentQuestionIndex;
  double get points => _points;
  PageController get controller => pageController;
  int get questionCount => _questionCount;

  Option? get selectedOption => _selectedOption;

  bool get canNavigate => _canNavigate;


  set questionCount(int count) {
    _questionCount = count;
    notifyListeners();
  }

  set currentQuestionIndex(int index) {
    _currentQuestionIndex = index;
    notifyListeners();
  }

  set points(double value) {
    _points = value;
    notifyListeners();
  }

  void reset() {
    _canNavigate = false;
    _selectedOption = null;
    _points = 0;
    _currentQuestionIndex = 0;
    questionCount = 0;
    notifyListeners();
  }

  void badResponse() {
    _points -= 5;
    notifyListeners();
  }

  void correctResponse() {
    _points += 10;
    notifyListeners();
  }

  void nextQuestion() {
    reset();
    if (_currentQuestionIndex < _questionCount) {
      _currentQuestionIndex++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    notifyListeners();
  }

  void selectOption(Option option) {
    _selectedOption = option;
    notifyListeners();
  }

  void validateSelectedOption() {
    if (_selectedOption != null) {
      if (_selectedOption!.isCorrect) {
        correctResponse();
      } else {
        badResponse();
      }
      _canNavigate = true;
    } else {
      _canNavigate = false;
    }
    notifyListeners();
  }
}
