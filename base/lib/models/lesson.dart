import 'package:equatable/equatable.dart';

import 'user.dart';

class Lesson extends Equatable{
  final int id;
  final int courseId;
  final String title;
  final String description;
  final String videoUrl;
  final String thumpNail;
  final LessonType lessonType;
  final User tutor;

  const Lesson({
    required this.id,
    required this.courseId,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.thumpNail,
    required this.tutor,
    required this.lessonType
  });

  @override
  List<Object?> get props => [
    id,
    courseId,
    title,
    description,
    videoUrl,
    thumpNail,
    tutor,
    lessonType
  ];

}

enum LessonType {
  VIDEO , QUIZ
}