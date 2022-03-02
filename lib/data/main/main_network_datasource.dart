import 'package:base/base.dart';
import 'package:base/models/category.dart';
import 'package:courseefy/mappers/category_mapper.dart';
import 'package:dio/dio.dart';
import 'package:main/logic/network_datasource.dart';
import 'package:courseefy/mappers/course_mapper.dart';
class MainNetworkDataSourceImp implements MainNetworkDataSource{
  final Dio dio;

  MainNetworkDataSourceImp(this.dio);

  @override
  Future<List<Category>> getCategories() async {
    try {
      var response = await dio.get("/categories?populate=cover&_limit=2");
      List<Map<String  , dynamic>> cats = List.from(response.data["data"]);
      return cats.isNotEmpty ? cats.map((cat) => CategoryMapper.fromApiResponse(cat)).toList() : [];
    } on DioError catch(e){
      throw DataException(e.response != null ? e.response!.data["error"]["message"] : "Network error", e.response != null ? e.response!.data["error"]["name"] : "Network error");
    }
  }

  @override
  Future<List<Course>> getCourses() async {
    try {
      var response = await dio.get("/courses?sort[0]=createdAt:desc&populate[0]=user.image&populate[1]=image&populate[2]=category.cover&populate[3]=rating&_limit=2");
      List<Map<String  , dynamic>> coursers = List.from(response.data["data"]);
      return coursers.isNotEmpty ? coursers.map((course) => CourseMapper.fromApiResponse(course)).toList() : [];
    } on DioError catch(e){
      throw DataException(e.response != null ? e.response!.data["error"]["message"] : "Network error", e.response != null ? e.response!.data["error"]["name"] : "Network error");
    }
  }

}