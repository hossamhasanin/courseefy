import 'package:base/base.dart';
import 'package:courseefy/mappers/user_mapper.dart';

class CourseReviewMapper{
  static CourseReview fromApiResponse(Map<String , dynamic> map){
    return CourseReview(
        UserMapper.fromNormalApiResponse(map["attributes"]["user"]["data"]),
        map["attributes"]["review"],
        DateTime.parse(map["attributes"]["createdAt"]).millisecondsSinceEpoch
    );
  }


}