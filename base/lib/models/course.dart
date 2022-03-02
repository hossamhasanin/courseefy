import 'package:base/base.dart';
import 'package:base/models/user.dart';
import 'package:equatable/equatable.dart';

class Course extends Equatable {

  final int id;
  final String title;
  final String image;
  final User tutor;
  final Category category;
  final String description;
  final int rating;
  final double duration;
  final double cost;
  final String level;

  const Course({
    required this.id,
    required this.title,
    required this.image,
    required this.tutor,
    required this.category,
    required this.description,
    required this.rating,
    required this.level,
    required this.cost,
    required this.duration
  });

  @override
  List<Object?> get props => [
    id,
    title,
    image,
    tutor,
    category,
    description,
    rating,
    level,
    cost,
    duration
  ];

}