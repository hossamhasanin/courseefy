import 'package:base/base.dart';

abstract class CourseDetailsDataSource {
  Future<List<CourseReview>> getReviews(int courseId , int page , {int pageSize = 3});
  Future<List<Lesson>> getLessons(int courseId);
}