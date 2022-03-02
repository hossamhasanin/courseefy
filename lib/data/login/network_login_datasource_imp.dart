import 'dart:convert';

import 'package:base/base.dart';
import 'package:base/models/user.dart';
import 'package:courseefy/configs.dart';
import 'package:courseefy/mappers/user_mapper.dart';
import 'package:dio/dio.dart';
import 'package:login/logic/network_datasource.dart';

class NetworkLoginDataSourceImp implements NetworkLoginDataSource{
  final Dio dio;

  NetworkLoginDataSourceImp({required this.dio});

  @override
  Future<User> googleLogin(String accessToken) async {
    try {
      var response = await dio.get("/auth/google/callback?access_token="+accessToken);
      print("Server response "+response.data.toString());
      if (response.statusCode == 200){
        return UserMapper.fromAuthApiResponse(response.data);
      } else {
        throw AuthException("Error login");
      }
    } catch (e){
      print("google login error "+ e.toString());
      throw AuthException(e.toString());
    }
  }

  @override
  Future<User> login(String email, String password) async {
    print(email + password);
    try {
      var response = await dio.post("/auth/local" , data: {
        // "identifier" : "kokojake13@gmail.com",
        // "password": "01011004584hG"
        "identifier" : email,
        "password": password
      });
      print("Server response "+response.data.toString());
      return UserMapper.fromAuthApiResponse(response.data);
    } on DioError catch (e){
      print("login error "+ e.response.toString());
      throw AuthException(e.response!.data["error"]["message"]);
    }
  }

}