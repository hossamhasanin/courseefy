import 'package:base/base.dart';
import 'package:courseefy/data/user/user_supplier.dart';
import 'package:hive/hive.dart';

class UserSupplierImp extends UserSupplier{

  User? _user;

  @override
  User? get user => _user;

  @override
  bool isLoggedIn() {
    return _user!= null;
  }

  @override
  Future cacheUser(User user) async {
    _user = user;
    var usersBox = await Hive.openBox<User>("users");
    await usersBox.clear();
    await usersBox.put(0 , user);
  }

  @override
  Future<User?> getUser() async {
    var usersBox = await Hive.openBox<User>("users");
    _user = usersBox.getAt(0);
    return _user;
  }

}