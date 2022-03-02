import 'package:base/base.dart';
import 'package:courseefy/configs.dart';

class CategoryMapper{
  static Category fromApiResponse(Map<String , dynamic> map){
    return Category(
        id: map["id"],
        title: map["attributes"]["title"],
        description: map["attributes"]["description"],
        cover: SERVER_URL + map["attributes"]["cover"]["data"]["attributes"]["url"]
      // cover: "http://192.168.1.11:1337/uploads/cat1_a6588ff767.png"
    );
  }
}