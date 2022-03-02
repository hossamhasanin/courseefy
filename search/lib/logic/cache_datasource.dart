import 'package:base/base.dart';

abstract class SearchCacheDataSource{
  Future<List<Category>> getCategories();
  Future cacheCategories(List<Category> categories);

  Future<List<String>> getTopSearches();
  Future cacheTopSearches(List<String> topSearches);
}