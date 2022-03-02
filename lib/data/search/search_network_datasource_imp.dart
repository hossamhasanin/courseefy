import 'package:base/base.dart';
import 'package:base/models/category.dart';
import 'package:courseefy/mappers/category_mapper.dart';
import 'package:courseefy/mappers/course_mapper.dart';
import 'package:dio/dio.dart';
import 'package:search/logic/filter/filter_selections.dart';
import 'package:search/logic/filter/filter_selections.dart';
import 'package:search/logic/network_datasource.dart';

class SearchNetworkDataSourceImp implements SearchNetworkDataSource{

  final Dio dio;

  SearchNetworkDataSourceImp(this.dio);

  @override
  Future<List<Category>> getCategories() async {
    try {
      var response = await dio.get("/categories?populate=cover");
      List<Map<String  , dynamic>> cats = List.from(response.data["data"]);
      return cats.isNotEmpty ? cats.map((cat) => CategoryMapper.fromApiResponse(cat)).toList() : [];
    } on DioError catch(e){
      print(e.message.toString());
      throw DataException(e.response != null ? e.response!.data["error"]["message"] : "Network error", e.response != null ? e.response!.data["error"]["name"] : "Network error");
    }
  }

  @override
  Future<List<String>> getTopSearches() async {
    try {
      var response = await dio.get("/searches");
      List<Map<String  , dynamic>> searches = List.from(response.data["data"]);
      return searches.isNotEmpty ? searches.map((search) => search.toString()).toList() : [];
    } on DioError catch(e){
      print("koko error "+e.message.toString());
      throw DataException(e.response != null ? e.response!.data["error"]["message"] : "Network error", e.response != null ? e.response!.data["error"]["name"] : "Network error");
    }
  }

  @override
  Future<List<Course>> getSearchedCourses(String searchQuery , List<FilterSelections> filters) async {
    try {
      var response = await dio.get("/courses?filters[title][\$contains]=$searchQuery"
          "&sort[0]=createdAt:desc"
          "&populate[0]=user.image"
          "&populate[1]=image"
          "&populate[2]=category.cover"
          "&populate[3]=rating&_limit=2"+_prepareFiltersParameters(filters));
      List<Map<String  , dynamic>> searches = List.from(response.data["data"]);
      return searches.isNotEmpty ? searches.map((course) => CourseMapper.fromApiResponse(course)).toList() : [];
    } on DioError catch(e){
      print("koko error "+e.message.toString());
      throw DataException(e.response != null ? e.response!.data["error"]["message"] : "Network error", e.response != null ? e.response!.data["error"]["name"] : "Network error");
    }
  }

  String _prepareFiltersParameters(List<FilterSelections> filters){
    String filtersPrams = "";
    for(var filter in filters){
      if (filter == FilterSelections.beginner){
        filtersPrams += "&filters[level][\$eq]=Beginner";
      } else if (filter == FilterSelections.intermediate){
        filtersPrams += "&filters[level][\$eq]=Intermediate";
      } else if (filter == FilterSelections.advanced){
        filtersPrams += "&filters[level][\$eq]=Advanced";
      } else if (filter == FilterSelections.freeCourses){
        filtersPrams += "&filters[cost][\$eq]=0";
      } else if (filter == FilterSelections.premiumCourses){
        filtersPrams += "&filters[cost][\$gte]=0";
      } else if (filter == FilterSelections.zeroToOneHours){
        filtersPrams += "&filters[duration][\$gte]=0&filters[duration][\$lt]=1";
      } else if (filter == FilterSelections.oneToThreeHours){
        filtersPrams += "&filters[duration][\$gte]=1&filters[duration][\$lt]=3";
      } else if (filter == FilterSelections.moreThanThreeHours){
        filtersPrams += "&filters[duration][\$gte]=3";
      } else {
        throw "No such a filter";
      }
    }

    return filtersPrams;
  }

}