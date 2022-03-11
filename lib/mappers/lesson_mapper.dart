import 'package:base/base.dart';
import 'package:courseefy/mappers/user_mapper.dart';

class LessonMapper {
  static Lesson fromApiResponse(Map<String , dynamic> map){
    return Lesson(
        id: map["id"],
        courseId: map["attributes"]["course"]["data"]["id"],
        title: map["attributes"]["title"],
        description: map["attributes"]["description"],
        videoUrl: map["attributes"]["videoUrl"],
        lessonType: _getLessonType(map["attributes"]["lessonType"]),
        tutor: UserMapper.fromNormalApiResponse(map["attributes"]["tutor"]["data"]),
        thumpNail: map["attributes"]["thumbNail"]["data"]["attributes"]["url"]);
  }

  static LessonType _getLessonType(String lessonType){
    if (lessonType == LessonType.VIDEO.toString()){
      return LessonType.VIDEO;
    } else if (lessonType == LessonType.QUIZ.toString()){
      return LessonType.QUIZ;
    } else {
      throw "No matched lesson type";
    }
  }
}