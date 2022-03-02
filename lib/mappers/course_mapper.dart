import 'package:base/base.dart';
import 'package:courseefy/configs.dart';
import 'package:courseefy/mappers/category_mapper.dart';
import 'package:courseefy/mappers/user_mapper.dart';

class CourseMapper{
  static Course fromApiResponse(Map<String , dynamic> map){
    return Course(
        id: map["id"],
        title: map["attributes"]["title"],
        description: map["attributes"]["description"],
        level: map["attributes"]["level"],
        cost: double.parse(map["attributes"]["cost"].toString()),
        duration: double.parse(map["attributes"]["duration"].toString()),
        image: SERVER_URL + map["attributes"]["image"]["data"]["attributes"]["url"],
        tutor: UserMapper.fromNormalApiResponse(map["attributes"]["user"]["data"]),
        category: CategoryMapper.fromApiResponse(map["attributes"]["category"]["data"]),
        rating: map["attributes"]["rating"]["data"] != null ?
        _calculateRating(map["attributes"]["rating"]["data"]) : 0
    );
  }

  static int _calculateRating(Map<String , dynamic> map){
    int oneStarRating = map["attributes"]["rating_1"];
    int twoStarRating = map["attributes"]["rating_2"];
    int threeStarRating = map["attributes"]["rating_3"];
    int fourStarRating = map["attributes"]["rating_4"];
    int fiveStarRating = map["attributes"]["rating_5"];
    return ((oneStarRating * 1) +
        (twoStarRating * 2) +
        (threeStarRating * 3) +
        (fourStarRating * 4) +
        (fiveStarRating * 5)) ~/
        (oneStarRating + twoStarRating + threeStarRating + fourStarRating + fiveStarRating);
  }

}