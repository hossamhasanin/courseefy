import 'package:base/base.dart';

abstract class NetworkLoginDataSource{
  Future<User> googleLogin(String accessToken);
  Future<User> login(String email , String password);


}