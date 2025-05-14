class Course {
  final String id;
  final String name;
  final String description;
  final String icon;
  final String type;
  final double progress;

  const Course({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.type,
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
