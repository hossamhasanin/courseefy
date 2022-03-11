import 'package:base/base.dart';

abstract class ClassRoomRepository {
  Future<DataWithError<List<Lesson>>> getLessons(int courseId , int page);
  Future<DataWithError<List<Lesson>>> getMoreLessons(int courseId , int page);
  Future<DataWithError<List<Course>>> getEnrolledCourses();
  Future<DataWithError<List<Course>>> getMoreEnrolledCourses(int page , {int pageSize = 20});
}