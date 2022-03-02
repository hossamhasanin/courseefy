import 'package:equatable/equatable.dart';

class Lesson extends Equatable{
  final int id;
  final int courseId;
  final String title;
  final String description;
  final String videoUrl;
  final String thumpNail;

  const Lesson({
    required this.id,
    required this.courseId,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.thumpNail
  });

  @override
  List<Object?> get props => [
    id,
    courseId,
    title,
    description,
    videoUrl,
    thumpNail
  ];

}