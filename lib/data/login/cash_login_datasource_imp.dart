import 'package:base/models/user.dart';
import 'package:courseefy/data/user/user_supplier.dart';
import 'package:login/logic/cash_datasource.dart';

class CashLoginDataSourceImp implements CashLoginDataSource{

  final UserSupplier _supplier;

  CashLoginDataSourceImp(this._supplier);

  @override
  Future cashLoginUser(User user) async {
    return _supplier.cacheUser(user);
  }

}