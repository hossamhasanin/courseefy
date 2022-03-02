import 'package:base/base.dart';
import 'package:hive/hive.dart';

class CacheUtility{
  static Future<bool> _isCacheDataValid(String key , {int minDays = 1 , minHours = 0 , minMinutes = 0}) async {
    var cacheUpdateRegister = await Hive.openBox<int>("cacheUpdateRegister");
    var lastUpdate = cacheUpdateRegister.get(key , defaultValue: 0)!;

    if (lastUpdate > 0){
      var time = DateTime.fromMillisecondsSinceEpoch(lastUpdate);
      var difference = DateTime.now().difference(time).abs();
      var isValid = false;
      if (minDays > 0){
        isValid = (difference.inHours / 24).round() <= minDays;
      } else if (minMinutes > 0){
        isValid = difference.inMinutes <= minMinutes;
      } else if (minHours > 0){
        isValid = difference.inHours <= minHours;
      }

      if (!isValid){
        cacheUpdateRegister.delete(key);
      }
      return isValid;
    }
    return false;
  }

  static updateLastCacheRegisterTime(String name) async {
    var cacheUpdateRegister = await Hive.openBox<int>("cacheUpdateRegister");
    cacheUpdateRegister.put(name, DateTime.now().millisecondsSinceEpoch);
  }

  static Future<List<T>> getCacheListDataIfValid<T>({
    required Box<T> fromBox,
    int minDays = 1 , minHours = 0 , minMinutes = 0
  }) async{
    if (await _isCacheDataValid(fromBox.name)){
      return fromBox.values.toList();
    } else {
      fromBox.clear();
      return [];
    }
  }

  static Future cacheList<T>(Box box , List<T> data) async{
    await CacheUtility.updateLastCacheRegisterTime(box.name);
    await box.clear();
    await box.addAll(data);
  }

}