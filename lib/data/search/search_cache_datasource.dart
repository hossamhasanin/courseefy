import 'package:base/models/category.dart';
import 'package:courseefy/data/cache/cache_utility.dart';
import 'package:hive/hive.dart';
import 'package:search/logic/cache_datasource.dart';

class SearchCacheDataSourceImp implements SearchCacheDataSource{
  @override
  Future cacheCategories(List<Category> categories) async {
    var categoriesBox = await Hive.openBox<Category>("categories");
    await CacheUtility.cacheList<Category>(categoriesBox, categories);
  }

  @override
  Future cacheTopSearches(List<String> topSearches) async {
    var searchesBox = await Hive.openBox<String>("searches");
    await CacheUtility.cacheList<String>(searchesBox, topSearches);
  }

  @override
  Future<List<Category>> getCategories() async {
    var categoriesBox = await Hive.openBox<Category>("categories");
    return CacheUtility.getCacheListDataIfValid(
        fromBox: categoriesBox
    );
  }

  @override
  Future<List<String>> getTopSearches() async {
    var searchesBox = await Hive.openBox<String>("searches");
    return CacheUtility.getCacheListDataIfValid(
        fromBox: searchesBox
    );
  }

}