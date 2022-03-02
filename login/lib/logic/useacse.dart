import 'package:base/base.dart';
import 'package:login/logic/logic_events.dart';
import 'package:login/logic/repository.dart';

class LoginUseCase{
  final LoginRepository _repository;

  LoginUseCase(this._repository);

  Future<LogicEvents> googleLogin(String accessToken) async {
    try{
      await _repository.googleLogin(accessToken);
      return ShowDoneLoginDialog();
    } on AuthException catch(e){
      return ShowErrorLoginDialog(e.message);
    }
  }

  Future<LogicEvents> login(String email , String password) async {
    try{
      await _repository.login(email, password);
      return ShowDoneLoginDialog();
    } on AuthException catch(e){
      return ShowErrorLoginDialog(e.message);
    }
  }
}