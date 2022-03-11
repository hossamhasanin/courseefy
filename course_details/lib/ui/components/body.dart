

import 'dart:html';

import 'package:base/base.dart';
import 'package:chewie/chewie.dart';
import 'package:course_details/logic/controller.dart';
import 'package:course_details/ui/components/overview_page.dart';
import 'package:course_details/ui/components/page_selection_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:base/base.dart';

import 'lessons_page.dart';
class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BdyState createState() => _BdyState();
}

class _BdyState extends State<Body> {
  late final VideoPlayerController _videoPlayerController;
  late final ChewieController _chewieController;
  final CourseDetailsController _courseDetailsController = Get.put(CourseDetailsController(Get.find()));

  @override
  void initState() {

    Course course = Get.arguments;

    // _videoPlayerController = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
    _videoPlayerController = VideoPlayerController.network(course.introVideoUrl);
    _videoPlayerController.initialize();

    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController
    );
    _courseDetailsController.init(course);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CourseDetailsController>(builder: (_){
            var viewState = _courseDetailsController.viewState;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    height: 200.0,
                    child: Chewie(controller: _chewieController)),
                const SizedBox(height: 20.0,),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 4.0 , horizontal: 15.0),
                          decoration: const BoxDecoration(
                            color: Color(0xffFD853A),
                          ),
                          child: const Text("HOT" , style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              fontFamily: "jakarta"
                          ),),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(viewState.course.tutor.image),
                            ),
                            const SizedBox(width: 10.0,),
                            Text(viewState.course.tutor.name , style:  const TextStyle(
                                color: Color(0xff404653),
                                fontSize: 16.0,
                                fontFamily: "jakarta",
                                fontWeight: FontWeight.w600
                            ),)
                          ],
                        ),
                      ),
                    ],),
                    GetBuilder<CourseDetailsController>(builder: (_){
                      var viewState = _courseDetailsController.viewState;
                      return ElevatedButton(onPressed: viewState.checkIfEnrolledInCourse ? null : (){

                      }, child: viewState.checkIfEnrolledInCourse ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Checking" , style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: "jakarta",
                            fontWeight: FontWeight.w600
                          ),),
                          SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: CircularProgressIndicator(color: Colors.white,))
                        ],
                      ) : const Text("Enroll" , style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: "jakarta",
                          fontWeight: FontWeight.w600
                      ),),);
                    })
                  ],
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(viewState.course.title ,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(height: 20.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.av_timer_outlined , color: Color(0xff888C94),size: 17.0,),
                          const SizedBox(width: 4.0,),
                          Text(calculateCourseDuration(viewState.course.duration) , style: Theme.of(context).textTheme.labelSmall )
                        ],
                      ),
                      const SizedBox(width: 20.0,),
                      Row(
                        children: [
                          const Icon(Icons.missed_video_call_outlined , color: Color(0xff888C94),size: 17.0,),
                          const SizedBox(width: 4.0,),
                          Text("12 lessons" , style: Theme.of(context).textTheme.labelSmall )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star_outlined , color: Color(0xff888C94),size: 17.0,),
                          const SizedBox(width: 4.0,),
                          Text("4.7" , style: Theme.of(context).textTheme.labelSmall)
                        ],
                      ),
                      const SizedBox(width: 20.0,),
                      Row(
                        children: [
                          const Icon(Icons.person_outlined , color: Color(0xff888C94),size: 17.0,),
                          const SizedBox(width: 4.0,),
                          Text(calculateNumberOfStudentsInCourse(viewState.course.studentNumber) , style: const TextStyle(
                              color: Color(0xff888C94),
                              fontSize: 14.0,
                              fontFamily: "jakarta",
                              fontWeight: FontWeight.w300
                          ) )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(viewState.course.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 5,
                  ),
                ),
              ],
            );
          }),
          const SizedBox(height: 28.0,),
          PageSelectionHeader(setPage: (isOverViewPage){
            _courseDetailsController.swipeBetweenLessonsOverview(isOverViewPage);
          },),
          Obx(() {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              transitionBuilder: (child , animation){
                return SlideTransition(
                  position: Tween<Offset>(begin: const Offset(1.2, 0),
                      end: const Offset(0, 0)).animate(animation),
                  child: child,
                );
              },
              child: _courseDetailsController.displayOverViewSection.value ?
              OverViewPage() : LessonsPage(),
            );
          }
          )
        ],
      ),
    );
  }
}
