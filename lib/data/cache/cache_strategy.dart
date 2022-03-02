
import 'package:base/base.dart';
import 'package:hive/hive.dart';

import 'cache_utility.dart';

class RepoCacheStrategy{
  static Future<DataWithError<List<T>>> getListDataFromNetworkIfCacheNotValid<T>({
    required Future<List<T>> Function() getDataFromCacheDataSource,
    required Future<List<T>> Function() getDataFromNetworkDataSource,
    required Future Function(List<T>) cacheListedData,
  }) async {
    var listedData = await getDataFromCacheDataSource();
    try {
      if (listedData.isEmpty){
        listedData = await getDataFromNetworkDataSource();
        await cacheListedData(listedData);
      }
      return DataWithError(listedData, null);
    } on DataException catch (e){
      return DataWithError(listedData, e);
    }
  }

}