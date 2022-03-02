import 'package:base/base.dart';

import 'filter/filter_selections.dart';

abstract class SearchNetworkDataSource {
  Future<List<String>> getTopSearches();
  Future<List<Category>> getCategories();

  Future<List<Course>> getSearchedCourses(String searchQuery , List<FilterSelections> filters);
}