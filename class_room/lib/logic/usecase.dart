import 'package:class_room/logic/repository.dart';

class ClassRoomUseCase {
  final ClassRoomRepository _repository;

  ClassRoomUseCase(this._repository);

  Future<dynamic> getLessons(int courseId , int page) async {
    var result = await _repository.getLessons(courseId , page);
    return [
      result.data,
      result.error
    ];
  }

  Future<dynamic> getMoreLessons(int courseId , int page) async {
    var result = await _repository.getMoreLessons(courseId , page);
    return [
      result.data,
      result.error
    ];
  }

  Future<dynamic> getCourses() async {
    var result = await _repository.getEnrolledCourses();
    return [
      result.data,
      result.error
    ];
  }

  Future<dynamic> getMoreCourses(int page) async {
    var result = await _repository.getMoreEnrolledCourses(page);
    return [
      result.data,
      result.error
    ];
  }

}