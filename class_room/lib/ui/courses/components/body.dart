import 'dart:html';

import 'package:class_room/logic/courses/courses_controller.dart';
import 'package:class_room/ui/courses/components/course_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final CoursesController _controller = Get.put(CoursesController(Get.find()));
  final RefreshController _refreshController = RefreshController();


  @override
  Widget build(BuildContext context) {
    return Obx((){
      var viewState = _controller.viewState.value;

      if (viewState.loading){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (viewState.courses.isEmpty){
        return const Center(
          child: Text("No enrolled courses yet" , style: TextStyle(
            fontFamily: "jakarata",
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
            color: Colors.black
          ),),
        );
      }

      if (viewState.error.isNotEmpty){
        return Center(
          child: Text(viewState.error , style: const TextStyle(
              fontFamily: "jakarata",
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
              color: Colors.black
          ),),
        );
      }

      return SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: (){

          },
        onLoading: (){

        },
          controller: _refreshController,
          child: ListView.builder(
            itemCount: viewState.courses.length,
            padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 20.0),
            itemBuilder: (_ , index){
              return CourseItem(
                  image: viewState.courses[index].title,
                  description: viewState.courses[index].description,
                  title: viewState.courses[index].description
              );
            },
          ),
      );

    });
  }
}
