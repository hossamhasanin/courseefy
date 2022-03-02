import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main/logic/controller.dart';
import 'package:main/ui/component/categories.dart';
import 'package:main/ui/component/courses_section.dart';
import 'package:main/ui/component/header.dart';
import 'package:main/ui/component/search_box.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final MainController _controller = Get.put(MainController(Get.find()));


  @override
  void initState() {
    super.initState();

    _controller.loadData();

    _controller.listenToLogicEvents(showErrorDialog: (error){
      showDialog(context: context, builder: (_){
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: SizedBox(
            height: 200.0,
            width: 300.0,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: Text(error ,
                    style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 18.0)),
              ),
            ),
          ),
        );
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 74,),

          Obx((){
            return Header(
              name: _controller.viewState.value.user.name,
              image: _controller.viewState.value.user.image,
            );
          }),

          Obx((){
            if (_controller.viewState.value.loading){
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: CircularProgressIndicator()),
              );
            } else {
              return Container();
            }
          }),

          const SearchBox(),

          Obx((){

            if (_controller.viewState.value.loading){
              return Container();
            }

            if (_controller.viewState.value.categories.isEmpty){
              return const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: Text("No Categories yet" , style: TextStyle(
                      fontFamily: "jakarta",
                      fontWeight: FontWeight.w300
                    ),),
                  ),
              );
            }
            return Categories(categories: _controller.viewState.value.categories,);
          }),
          Obx((){
            if (_controller.viewState.value.loading){
              return Container();
            }

            if (_controller.viewState.value.courses.isEmpty){
             return const Padding(
               padding: EdgeInsets.all(20.0),
               child: Center(
                 child: Text("No courses yet" , style: TextStyle(
                     fontFamily: "jakarta",
                     fontWeight: FontWeight.w300
                 ),),
               ),
             );
            }
            return CoursesSection(
                title: "Most Watching \n category in month ",
                courses: _controller.viewState.value.courses,
                seeMoreAction: (){

                });
          })
        ],
      ),
    );
  }
}
