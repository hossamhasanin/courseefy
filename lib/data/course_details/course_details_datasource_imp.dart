import 'package:base/base.dart';
import 'package:base/models/course_review.dart';
import 'package:base/models/lesson.dart';
import 'package:course_details/logic/datasource.dart';
import 'package:courseefy/mappers/course_review_mapper.dart';
import 'package:courseefy/mappers/lesson_mapper.dart';
import 'package:dio/dio.dart';

class CourseDetailsDataSourceImp implements CourseDetailsDataSource {

  final Dio dio;

  CourseDetailsDataSourceImp(this.dio);


  @override
  Future<List<CourseReview>> getReviews(int courseId, int page, {int pageSize = 3}) async {
    try {
      var response = await dio.get("/course-reviews?"
          "filters[course][course_reviews][id]=$courseId"
          "&pagination[page]=$page"
          "&pagination[pageSize]=$pageSize"
          "&populate[0]=user.image");
      List<Map<String  , dynamic>> data = List.from(response.data["data"]);

      return data.map((reviewMap) => CourseReviewMapper.fromApiResponse(reviewMap)).toList();
    } on DioError catch(e){
      throw DataException(e.response != null ? e.response!.data["error"]["message"]
          :"Connection error", "");
    }
  }

  @override
  Future<List<Lesson>> getLessons(int courseId, int page, {int pageSize = 10}) async {
    try {
      var response = await dio.get("/lessons?"
          "populate[0]=tutor.image"
          "&populate[1]=thumpNail"
          "&pagination[page]=$page"
          "&pagination[pageSize]=$pageSize"
      );
      List<Map<String  , dynamic>> data = List.from(response.data["data"]);

      return data.map((reviewMap) => LessonMapper.fromApiResponse(reviewMap)).toList();
    } on DioError catch(e){
      throw DataException(e.response != null ? e.response!.data["error"]["message"]
          :"Connection error", "");
    }
  }

  @override
  Future<bool> isEnrolledInTheCourse(int courseId) {
    // TODO: implement isEnrolledInTheCourse
    throw UnimplementedError();
  }


}