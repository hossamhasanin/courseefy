import 'package:base/models/category.dart';
import 'package:base/models/course.dart';
import 'package:base/models/user.dart';
import 'package:courseefy/data/cache/cache_utility.dart';
import 'package:courseefy/data/user/user_supplier.dart';
import 'package:hive/hive.dart';
import 'package:main/logic/cache_datasource.dart';

class MainCacheDataSourceImp implements MainCacheDataSource{

  final UserSupplier _userSupplier;

  MainCacheDataSourceImp(this._userSupplier);

  @override
  Future cacheCategory(List<Category> categories) async {
    var categoriesBox = await Hive.openBox<Category>("categories");
    await CacheUtility.cacheList<Category>(categoriesBox, categories);
  }

  @override
  Future<List<Category>> getCategories() async {
    var categoriesBox = await Hive.openBox<Category>("categories");
    return CacheUtility.getCacheListDataIfValid(
        fromBox: categoriesBox
    );
  }

  @override
  User? getUser() {
    print(_userSupplier.user!.image);
    return _userSupplier.user;
  }

  @override
  Future<List<Course>> getCourses() async {
    var coursesBox = await Hive.openBox<Course>("courses");
    return CacheUtility.getCacheListDataIfValid(
        fromBox: coursesBox
    );
  }

  @override
  Future cacheCourses(List<Course> courses) async {
    var coursesBox = await Hive.openBox<Course>("courses");
    await CacheUtility.cacheList<Course>(coursesBox, courses);
  }

}