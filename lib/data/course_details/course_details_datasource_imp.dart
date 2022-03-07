import 'package:base/base.dart';
import 'package:base/models/course_review.dart';
import 'package:base/models/lesson.dart';
import 'package:course_details/logic/datasource.dart';
import 'package:dio/dio.dart';

class CourseDetailsDataSourceImp implements CourseDetailsDataSource {

  final Dio dio;

  CourseDetailsDataSourceImp(this.dio);


  @override
  Future<List<Lesson>> getLessons(int courseId) {
    // TODO: implement getLessons
    throw UnimplementedError();
  }

  @override
  Future<List<CourseReview>> getReviews(int courseId, int page, {int pageSize = 3}) async {
    try {
      var response = await dio.get("/course-reviews?"
          "filters[course][course_reviews][id]=$courseId"
          "&pagination[page]=$page"
          "&pagination[pageSize]=$pageSize");
      return [];
    } on DioError catch(e){
      throw DataException(e.response != null ? e.response!.data["error"]["message"]
          :"Connection error", "");
    }
  }


}