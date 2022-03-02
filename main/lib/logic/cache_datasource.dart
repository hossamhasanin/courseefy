import 'package:base/base.dart';

abstract class MainCacheDataSource{
  Future cacheCategory(List<Category> categories);
  Future cacheCourses(List<Course> courses);
  Future<List<Category>> getCategories();
  Future<List<Course>> getCourses();
  User? getUser();
}