import 'package:base/base.dart';
import 'package:base/models/user.dart';
import 'package:equatable/equatable.dart';

class Course extends Equatable {

  final int id;
  final String title;
  final String image;
  final String introVideoUrl;
  final User tutor;
  final Category category;
  final String description;
  final int rating;
  final double duration;
  final double cost;
  final String level;
  final String introduction;
  final int studentNumber;

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
    required this.duration,
    required this.introduction,
    required this.introVideoUrl,
    required this.studentNumber
  });

  factory Course.empty(){
    return Course(
        id: -1,
        title: "",
        image: "",
        tutor: User.empty(),
        category: Category.empty(),
        description: "",
        rating: 0,
        level: "",
        cost: 0,
        duration: 0,
        introduction: "",
        introVideoUrl: "",
        studentNumber: 0
    );
  }

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
    duration,
    introduction,
    introVideoUrl,
    studentNumber
  ];

}