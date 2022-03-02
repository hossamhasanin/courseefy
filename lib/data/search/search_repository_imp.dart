import 'package:base/base.dart';
import 'package:base/models/category.dart';
import 'package:base/models/course.dart';
import 'package:base/models/data_with_error.dart';
import 'package:courseefy/data/cache/cache_strategy.dart';
import 'package:search/logic/cache_datasource.dart';
import 'package:search/logic/filter/filter_selections.dart';
import 'package:search/logic/network_datasource.dart';
import 'package:search/logic/repository.dart';

class SearchRepositoryImp implements SearchRepository{

  final SearchNetworkDataSource _networkDataSource;
  final SearchCacheDataSource _cacheDataSource;

  SearchRepositoryImp(this._networkDataSource, this._cacheDataSource);


  @override
  Future<DataWithError<List<Category>>> getCategories() {
    return RepoCacheStrategy.getListDataFromNetworkIfCacheNotValid<Category>(
        getDataFromCacheDataSource: (){
          return _cacheDataSource.getCategories();
        },
        getDataFromNetworkDataSource: (){
          return _networkDataSource.getCategories();
        }, cacheListedData: (categories) async {
      await _cacheDataSource.cacheCategories(categories);
    });
  }

  @override
  Future<DataWithError<List<String>>> getTopSearches() {
    return RepoCacheStrategy.getListDataFromNetworkIfCacheNotValid<String>(
        getDataFromCacheDataSource: (){
          return _cacheDataSource.getTopSearches();
        },
        getDataFromNetworkDataSource: (){
          return _networkDataSource.getTopSearches();
        }, cacheListedData: (searches) async {
      await _cacheDataSource.cacheTopSearches(searches);
    });
  }

  @override
  Future<DataWithError<List<Course>>> getSearchedCourses(String searchQuery , List<FilterSelections> filters) async {
    try{
      return DataWithError(await _networkDataSource.getSearchedCourses(searchQuery , filters), null);
    } catch (e){
      print(e.toString());
      return DataWithError([], e as DataException);
    }
  }


  
}