import 'package:base/base.dart';

abstract class CashLoginDataSource{
  Future cashLoginUser(User user);
}