import 'package:base/base.dart';
import 'package:equatable/equatable.dart';

class CourseReview extends Equatable {

  final User user;
  final String review;
  final int timeStamp;

  const CourseReview(this.user, this.review, this.timeStamp);

  @override
  List<Object?> get props => [
    user,
    review,
    timeStamp
  ];

}