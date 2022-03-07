import 'package:base/base.dart';
import 'package:course_details/logic/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LessonsPage extends StatelessWidget {

  final CourseDetailsController _controller = Get.find();
  LessonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseDetailsController>(
      builder: (_) {
        var viewState = _controller.viewState;

        if (viewState.loadingLessons){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (viewState.lessons.isEmpty){
          return Center(
            child: Text("Looks like there is no lessons yet.",
              style: Theme.of(context).textTheme.headline1,),
          );
        }

        return ListView.builder(
          itemCount: viewState.lessons.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (_ , index){
            return Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 30.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 135.0,
                        child: Image.network(viewState.lessons[index].thumpNail , fit: BoxFit.fill,),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(viewState.lessons[index].title , style: Theme.of(context).textTheme.headlineMedium,),
                          const SizedBox(height: 6.0,),
                          Text("Lesson ${index + 1}" , style: const TextStyle(
                            color: Color(0xff585D69),
                            fontFamily: "jakarta",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600
                          ),)
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          },
        );
      }
    );
  }
}
