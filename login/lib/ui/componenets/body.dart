
import 'dart:async';

import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/logic/controller.dart';
import 'package:login/logic/logic_events.dart';
import 'package:login/ui/componenets/login_button_media.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final TextEditingController _emailController  = TextEditingController();
  final TextEditingController _passwordController  = TextEditingController();

  final LoginController _controller = LoginController(Get.find(), Get.find());

  BuildContext? _dialogContext;

  StreamSubscription<LogicEvents>? _logicListener;

  @override
  void initState() {
    super.initState();


    _logicListener = _controller.logicEventsStream.listen((event) {
      if (_dialogContext != null){
        Navigator.pop(_dialogContext!);
        _dialogContext = null;
      }

      if (event is ShowErrorLoginDialog){
        showDialog(context: context, builder: (_){
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            child: SizedBox(
              height: 200.0,
              width: 300.0,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                  child: Text(event.error ,
                      style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 18.0)),
                ),
              ),
            ),
          );
        });
      }

      if (event is ShowDoneLoginDialog){
        _dialogContext = Get.overlayContext;
        showDialog(context: _dialogContext!, builder: (_){
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            child: Container(
              height: 200.0,
              width: 300.0,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Login successfully" ,
                      style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18.0)),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pop(_dialogContext!);
                        Get.offNamed(HOME_SCREEN);
                        _dialogContext = null;
                      }, child: const Text("Done"))
                ],
              ),
            ),
          );
        } , barrierDismissible: false);
      }
    });

  }

  @override
  void dispose() {
    _logicListener!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 90,),
          const Text("Welcome back!" , style: TextStyle(
            fontFamily: "jakarta",
            fontSize: 26,
            fontWeight: FontWeight.w700
          ),),
          const Text("Sign in to continue" , style: TextStyle(
            fontFamily: "jakarta",
            fontSize: 26,
            fontWeight: FontWeight.w700
          ),),
          const SizedBox(height: 30,),
          MediaLogin(
              icon: "assets/icons/google_icon.png",
              text: "Log in with google",
              action: (){
                _controller.googleLogin();
              }),
          const SizedBox(height: 20,),
          MediaLogin(
              icon: "assets/icons/facebook_icon.png",
              text: "Log in with facebook",
              action: (){

              }),
          const SizedBox(height: 20,),
          const Text("or" , style: TextStyle(
              fontFamily: "jakarta",
              fontSize: 18,
              fontWeight: FontWeight.w100
          ),),
          Padding(
            padding: const EdgeInsets.only(left: 20.0 , right: 20.0 , bottom: 20.0),
            child: TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                label: Text("Email")
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0 , right: 20.0 , bottom: 20.0),
            child: TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                label: const Text("Password"),
                suffixIcon: IconButton(onPressed: (){

                }, icon: const Icon(Icons.visibility))
              ),
              obscureText: true,
            ),
          ),
          const SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              _controller.login(_emailController.text, _passwordController.text);
            },
            child: Container(
              padding: const EdgeInsets.only(top: 19.5 , bottom: 19.5),
              margin: const EdgeInsets.only(left: 20 , right: 20),
              decoration: const BoxDecoration(
                  color: Color(0xff265AE8),
                  borderRadius: BorderRadius.all(Radius.circular(6.0))
              ),
              child: const Center(
                child: Text("Login" , style: TextStyle(
                  fontFamily: "jakarta",
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 16
                ),),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          GestureDetector(
            onTap: (){

            },
            child: const Text("Forgot password" , style: TextStyle(
              color: Color(0xff265AE8),
                fontFamily: "jakarta",
                fontWeight: FontWeight.w700,
                fontSize: 16
            ),),
          )
        ],
      ),
    );
  }
}
