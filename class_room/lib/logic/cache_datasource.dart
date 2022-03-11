import 'package:base/base.dart';

abstract class ClassRoomCacheDataSource {
  Future<List<Lesson>> getLessons(String courseId);
  Future<List<Course>> getEnrolledCourses();
}