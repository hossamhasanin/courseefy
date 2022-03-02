import 'package:base/base.dart';

import 'filter/filter_selections.dart';

abstract class SearchRepository{
  Future<DataWithError<List<String>>> getTopSearches();
  Future<DataWithError<List<Category>>> getCategories();

  Future<DataWithError<List<Course>>> getSearchedCourses(String searchQuery , List<FilterSelections> filters);
}