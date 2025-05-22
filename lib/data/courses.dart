class Course {
  final String id;
  final String name;
  final String description;
  final String icon;
  final String type;
  final double progress;
  final List<Subject> subjects;

  const Course({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.type,
    required this.progress,
    this.subjects = const [],
  });
}

class Option {
  final String id;
  final String option;
  final bool isCorrect;

  const Option({
    required this.id,
    required this.option,
    required this.isCorrect,
  });
}

class Question {
  final String id;
  final String title;
  final String question;
  final List<Option> options;

  const Question({
    required this.id,
    required this.title,
    required this.question,
    required this.options,
  });
}

class Subject {
  final String id;
  final int order;
  final String name;
  final double progress;
  final List<Question> questions;

  const Subject({
    this.questions = const [],
    required this.id,
    required this.order,
    required this.name,
    required this.progress,
  });
}

final List<Course> courses = [
  Course(
    id: 'course1',
    name: 'Álgebra',
    description: 'Aprenda los conceptos básicos de álgebra',
    icon: 'formula',
    type: 'secondary',
    progress: 0.5,
    subjects: [
      Subject(
        id: 'subject1',
        order: 1,
        name: 'Ecuaciones',
        progress: 1,
        questions: [
          Question(
            id: 'question1',
            title: '¿Cuál es la solución de la ecuación?',
            question: 'x + 2 = 5',
            options: [
              Option(id: 'option1', option: 'x = 3', isCorrect: true),
              Option(id: 'option2', option: 'x = 5', isCorrect: false),
              Option(id: 'option3', option: 'x = 7', isCorrect: false),
              Option(id: 'option4', option: 'x = 0', isCorrect: false),
            ],
          ),
          Question(
            id: 'question2',
            title: '¿Cuál es la solución de la ecuación?',
            question: '2x - 4 = 10',
            options: [
              Option(id: 'option1', option: 'x = 7', isCorrect: true),
              Option(id: 'option2', option: 'x = 5', isCorrect: false),
              Option(id: 'option3', option: 'x = 3', isCorrect: false),
              Option(id: 'option4', option: 'x = 0', isCorrect: false),
            ],
          ),
          Question(
            id: 'question3',
            title: '¿Cuál es la solución de la ecuación?',
            question: '3x + 2 = 11',
            options: [
              Option(id: 'option1', option: 'x = 3', isCorrect: true),
              Option(id: 'option2', option: 'x = 5', isCorrect: false),
              Option(id: 'option3', option: 'x = 7', isCorrect: false),
              Option(id: 'option4', option: 'x = 0', isCorrect: false),
            ],
          ),
          Question(
            id: 'question4',
            title: '¿Cuál es la solución de la ecuación?',
            question: '4x - 8 = 0',
            options: [
              Option(id: 'option1', option: 'x = 2', isCorrect: true),
              Option(id: 'option2', option: 'x = 5', isCorrect: false),
              Option(id: 'option3', option: 'x = 7', isCorrect: false),
              Option(id: 'option4', option: 'x = 0', isCorrect: false),
            ],
          ),
          Question(
            id: 'question5',
            title: '¿Cuál es la solución de la ecuación?',
            question: '5x + 3 = 18',
            options: [
              Option(id: 'option1', option: 'x = 3', isCorrect: true),
              Option(id: 'option2', option: 'x = 5', isCorrect: false),
              Option(id: 'option3', option: 'x = 7', isCorrect: false),
              Option(id: 'option4', option: 'x = 0', isCorrect: false),
            ],
          ),
          Question(
            id: 'question6',
            title: '¿Cuál es la solución de la ecuación?',
            question: '6x - 12 = 0',
            options: [
              Option(id: 'option1', option: 'x = 2', isCorrect: true),
              Option(id: 'option2', option: 'x = 5', isCorrect: false),
              Option(id: 'option3', option: 'x = 7', isCorrect: false),
              Option(id: 'option4', option: 'x = 0', isCorrect: false),
            ],
          ),
          Question(
            id: 'question7',
            title: '¿Cuál es la solución de la ecuación?',
            question: '7x + 1 = 15',
            options: [
              Option(id: 'option1', option: 'x = 2', isCorrect: true),
              Option(id: 'option2', option: 'x = 5', isCorrect: false),
              Option(id: 'option3', option: 'x = 7', isCorrect: false),
              Option(id: 'option4', option: 'x = 0', isCorrect: false),
            ],
          ),
          Question(
            id: 'question8',
            title: '¿Cuál es la solución de la ecuación?',
            question: '8x - 16 = 0',
            options: [
              Option(id: 'option1', option: 'x = 2', isCorrect: true),
              Option(id: 'option2', option: 'x = 5', isCorrect: false),
              Option(id: 'option3', option: 'x = 7', isCorrect: false),
              Option(id: 'option4', option: 'x = 0', isCorrect: false),
            ],
          ),
          Question(
            id: 'question9',
            title: '¿Cuál es la solución de la ecuación?',
            question: '9x + 3 = 30',
            options: [
              Option(id: 'option1', option: 'x = 3', isCorrect: true),
              Option(id: 'option2', option: 'x = 5', isCorrect: false),
              Option(id: 'option3', option: 'x = 7', isCorrect: false),
              Option(id: 'option4', option: 'x = 0', isCorrect: false),
            ],
          ),
          Question(
            id: 'question10',
            title: '¿Cuál es la solución de la ecuación?',
            question: '10x - 20 = 0',
            options: [
              Option(id: 'option1', option: 'x = 2', isCorrect: true),
              Option(id: 'option2', option: 'x = 5', isCorrect: false),
              Option(id: 'option3', option: 'x = 7', isCorrect: false),
              Option(id: 'option4', option: 'x = 0', isCorrect: false),
            ],
          ),
        ],
      ),
      Subject(id: 'subject2', order: 2, name: 'Polinomios', progress: 0.33),
      Subject(id: 'subject3', order: 3, name: 'Funciones', progress: 0),
      Subject(id: 'subject4', order: 4, name: 'Inecuaciones', progress: 0.6),
      Subject(
        id: 'subject5',
        order: 5,
        name: 'Sistemas de Ecuaciones',
        progress: 0.4,
      ),
      Subject(id: 'subject6', order: 6, name: 'Matrices', progress: 0.7),
      Subject(id: 'subject7', order: 7, name: 'Determinantes', progress: 0.2),
    ],
  ),
  Course(
    id: 'course2',
    name: 'Aritmética',
    description: 'Aprenda los conceptos básicos de aritmética',
    icon: 'percent',
    type: 'tertiary',
    progress: 0.2,
  ),
  Course(
    id: 'course3',
    name: 'Geometria',
    description: 'Aprenda los conceptos básicos de geometría',
    icon: 'cone',
    type: 'primary',
    progress: 0.3,
  ),
  Course(
    id: 'course4',
    name: 'Trigonometria',
    description: 'Aprenda los conceptos básicos de trigonometría',
    icon: 'calculator',
    type: 'secondary',
    progress: 0.8,
  ),
  Course(
    id: 'course5',
    name: 'Razonamiento Matemático',
    description: 'Aprenda los conceptos básicos de razonamiento matemático',
    icon: 'balance',
    type: 'tertiary',
    progress: 0.6,
  ),
];
