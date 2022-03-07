import 'package:base/base.dart';
import 'package:course_details/ui/course_details_screen.dart';
import 'package:courseefy/dependencies.dart';
import 'package:courseefy/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:login/ui/login_screen.dart';
import 'package:main/main.dart';
import 'package:search/ui/search_screen.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    init();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: Color(0xff282F3E),
            fontFamily: "jakarta",
            fontSize: 16.0,
            fontWeight: FontWeight.w600
          ),
          headlineSmall: TextStyle(
            color: Color(0xff282F3E),
            fontFamily: "jakarta",
            fontSize: 15.0,
            fontWeight: FontWeight.w300
          ),
          labelSmall: TextStyle(
              color: Color(0xff9FA3A9),
              fontFamily: "jakarta",
              fontSize: 11.0,
              fontWeight: FontWeight.w300
          ),
          titleMedium: TextStyle(
              color: Color(0xff282F3E),
              fontFamily: "jakarta",
              fontSize: 22.0,
              fontWeight: FontWeight.w600
          ),
          bodySmall: TextStyle(
              color: Color(0xff585D69),
              fontFamily: "jakarta",
              fontSize: 15.0,
              fontWeight: FontWeight.w300
          ),
          bodyMedium: TextStyle(
              color: Color(0xff585D69),
              fontFamily: "jakarta",
              fontSize: 16.0,
              fontWeight: FontWeight.w300
          )
        )
      ),
      home: const CourseDetailsScreen(),
      getPages: [
        GetPage(name: LOGIN_SCREEN, page:()=> const LoginScreen()),
        GetPage(name: HOME_SCREEN, page:()=> HomeScreen()),
      ],
    );
  }
}

