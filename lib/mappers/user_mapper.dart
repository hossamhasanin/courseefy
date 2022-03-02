import 'package:base/base.dart';
import 'package:courseefy/configs.dart';

class UserMapper{
  static User fromAuthApiResponse(Map<String , dynamic> map){
    return User(
        name: map["user"]["username"],
        email: map["user"]["email"],
        token: map["jwt"],
        image: SERVER_URL + map["user"]["image"]["url"],
        id: int.parse(map["user"]["id"].toString())
    );
  }

  static User fromNormalApiResponse(Map<String , dynamic> map){
    return User(
        name: map["attributes"]["username"],
        email: map["attributes"]["email"],
        token: "",
        image: SERVER_URL + map["attributes"]["image"]["data"]["attributes"]["url"],
        id: int.parse(map["id"].toString())
    );
  }

}