import 'package:course_details/logic/datasource.dart';
import 'package:courseefy/configs.dart';
import 'package:courseefy/data/cache/adapters/category_adapter.dart';
import 'package:courseefy/data/cache/adapters/course_adapter.dart';
import 'package:courseefy/data/course_details/course_details_datasource_imp.dart';
import 'package:courseefy/data/main/main_cache_datasource_imp.dart';
import 'package:courseefy/data/main/main_network_datasource.dart';
import 'package:courseefy/data/cache/adapters/user_adapter.dart';
import 'package:courseefy/data/search/search_cache_datasource.dart';
import 'package:courseefy/data/search/search_network_datasource_imp.dart';
import 'package:courseefy/data/search/search_repository_imp.dart';
import 'package:courseefy/data/user/user_supplier.dart';
import 'package:courseefy/data/user/user_supplier_imp.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:login/logic/cash_datasource.dart';
import 'package:login/logic/network_datasource.dart';
import 'package:main/logic/cache_datasource.dart';
import 'package:main/logic/controller.dart';
import 'package:main/logic/network_datasource.dart';
import 'package:main/logic/repository.dart';
import 'package:search/logic/cache_datasource.dart';
import 'package:search/logic/network_datasource.dart';
import 'package:search/logic/repository.dart';

import 'data/login/cash_login_datasource_imp.dart';
import 'data/login/network_login_datasource_imp.dart';
import 'data/main/main_repository_imp.dart';

init(){
  Get.put<UserAdapter>(UserAdapter());
  Get.put<CategoryAdapter>(CategoryAdapter());
  if (!Hive.isAdapterRegistered(0)){
    Hive.registerAdapter(Get.find<UserAdapter>());
  }
  if (!Hive.isAdapterRegistered(1)){
    Hive.registerAdapter(Get.find<CategoryAdapter>());
  }

  if (!Hive.isAdapterRegistered(2)){
    Hive.registerAdapter(CourseAdapter(Get.find<UserAdapter>() , Get.find<CategoryAdapter>()));
  }
  Get.put<UserSupplier>(UserSupplierImp());
  Get.put<Dio>(Dio()..options.baseUrl= SERVER_URL+"/api");
  Get.put<NetworkLoginDataSource>(NetworkLoginDataSourceImp(dio: Get.find()));
  Get.put<CashLoginDataSource>(CashLoginDataSourceImp(Get.find()));

  Get.put<MainNetworkDataSource>(MainNetworkDataSourceImp(Get.find()));
  Get.put<MainCacheDataSource>(MainCacheDataSourceImp(Get.find()));
  Get.put<MainRepository>(MainRepositoryImp(Get.find() , Get.find()));

  Get.put<SearchNetworkDataSource>(SearchNetworkDataSourceImp(Get.find()));
  Get.put<SearchCacheDataSource>(SearchCacheDataSourceImp());
  Get.put<SearchRepository>(SearchRepositoryImp(Get.find() , Get.find()));

  Get.put<CourseDetailsDataSource>(CourseDetailsDataSourceImp(Get.find()));

}