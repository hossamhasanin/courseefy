import 'package:base/base.dart';

abstract class MainNetworkDataSource{
  Future<List<Category>> getCategories();
  Future<List<Course>> getCourses();
}