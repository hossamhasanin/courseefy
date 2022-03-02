import 'package:base/base.dart';
import 'package:login/logic/cash_datasource.dart';
import 'package:login/logic/network_datasource.dart';

class LoginRepository{

  final NetworkLoginDataSource _networkLoginDataSource;
  final CashLoginDataSource _cashLoginDataSource;

  LoginRepository(this._networkLoginDataSource, this._cashLoginDataSource);

  Future googleLogin(String accessToken) async {
    User user = await _networkLoginDataSource.googleLogin(accessToken);
    await _cashLoginDataSource.cashLoginUser(user);
  }

  Future login(String email , String password) async {
    User user = await _networkLoginDataSource.login(email , password);
    await _cashLoginDataSource.cashLoginUser(user);
  }
}