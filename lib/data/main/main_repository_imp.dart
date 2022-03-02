import 'package:base/models/category.dart';
import 'package:base/models/course.dart';
import 'package:base/models/data_with_error.dart';
import 'package:base/models/user.dart';
import 'package:courseefy/data/cache/cache_strategy.dart';
import 'package:main/logic/cache_datasource.dart';
import 'package:main/logic/network_datasource.dart';
import 'package:main/logic/repository.dart';

class MainRepositoryImp implements MainRepository{

  final MainNetworkDataSource _networkDataSource;
  final MainCacheDataSource _cacheDataSource;

  MainRepositoryImp(this._networkDataSource, this._cacheDataSource);

  @override
  Future<DataWithError<List<Category>>> getCategories() {
    return RepoCacheStrategy.getListDataFromNetworkIfCacheNotValid<Category>(
        getDataFromCacheDataSource: (){
          return _cacheDataSource.getCategories();
        },
        getDataFromNetworkDataSource: (){
          return _networkDataSource.getCategories();
        }, cacheListedData: (categories) async {
          await _cacheDataSource.cacheCategory(categories);
    });
  }

  @override
  Future<User?> getUser() async {
    return _cacheDataSource.getUser();
  }

  @override
  Future<DataWithError<List<Course>>> getCourses() async {
    return RepoCacheStrategy.getListDataFromNetworkIfCacheNotValid<Course>(
        getDataFromCacheDataSource: (){
          return _cacheDataSource.getCourses();
        },
        getDataFromNetworkDataSource: (){
          return _networkDataSource.getCourses();
        }, cacheListedData: (courses) async {
      await _cacheDataSource.cacheCourses(courses);
    });
  }

}