import 'dart:async';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/logic/cash_datasource.dart';
import 'package:login/logic/logic_events.dart';
import 'package:login/logic/network_datasource.dart';
import 'package:login/logic/repository.dart';
import 'package:login/logic/useacse.dart';

class LoginController extends GetxController{
  late final LoginUseCase _useCase;

  final StreamController<LogicEvents> _logicStreamController = StreamController();
  Stream<LogicEvents> get logicEventsStream => _logicStreamController.stream;

  LoginController(NetworkLoginDataSource networkLoginDataSource , CashLoginDataSource cashLoginDataSource){
    _useCase = LoginUseCase(LoginRepository(networkLoginDataSource , cashLoginDataSource));
  }

  googleLogin() async {
    var token = await _googleSignInToken();
    if (token != null){
      print("accesss token "+ token);
      _logicStreamController.add(await _useCase.googleLogin(token));
    }
  }

  login(String email , String password) async {
    if (email.trim().isEmpty || password.trim().isEmpty){
      return;
    }
    _logicStreamController.add(await _useCase.login(email.trim(), password.trim()));
  }

  Future<String?> _googleSignInToken() async{
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null){
      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      return googleSignInAuthentication.accessToken;
    } else {
      return null;
    }
  }

}