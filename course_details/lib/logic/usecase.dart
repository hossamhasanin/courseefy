import 'package:base/base.dart';
import 'package:course_details/logic/datasource.dart';

class CourseDetailsUseCase {
  final CourseDetailsDataSource _dataSource;

  CourseDetailsUseCase(this._dataSource);

  Future<dynamic> getReviews(int courseId , int page) async {
    try {
      var results = await _dataSource.getReviews(courseId , page);
      return results;
    } on DataException catch(e){
      return e;
    }
  }

  Future<dynamic> getLessons(int courseId , int page) async {
    try {
      var results = await _dataSource.getLessons(courseId , page);
      return results;
    } on DataException catch(e){
      return e;
    }
  }

  Future<dynamic> isEnrolledInCourse(int courseId) async {
    try {
      var results = await _dataSource.isEnrolledInTheCourse(courseId);
      return results;
    } on DataException catch(e){
      return e;
    }
  }

}