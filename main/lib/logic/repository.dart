import 'package:base/base.dart';
import 'package:main/logic/cache_datasource.dart';
import 'package:main/logic/network_datasource.dart';

abstract class MainRepository{
  final MainNetworkDataSource _networkDataSource;
  final MainCacheDataSource _cacheDataSource;

  MainRepository(this._networkDataSource, this._cacheDataSource);


  Future<DataWithError<List<Category>>> getCategories();

  // Future<DataWithError<List<Category>>> getCategories() async {
  //   try {
  //     var categories = await _networkDataSource.getCategories();
  //     _cacheDataSource.cacheCategory(categories);
  //     return DataWithError(categories, null);
  //   } on DataException catch (e){
  //     var categories = await _cacheDataSource.getCategories();
  //     return DataWithError(categories, e);
  //   }
  // }

  // Future<User?> getUser() async {
  //   return _cacheDataSource.getUser();
  // }

  Future<DataWithError<List<Course>>> getCourses();
  Future<User?> getUser();

}