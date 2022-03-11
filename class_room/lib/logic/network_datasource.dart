import 'package:base/base.dart';

abstract class ClassRoomNetworkDataSource{
  Future<List<Lesson>> getLessons(String courseId , int page , {int pageSize = 20});
  Future<List<Course>> getEnrolledCourses(int page , {int pageSize = 20});
}