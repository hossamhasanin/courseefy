import 'package:base/base.dart';
import 'package:base/models/course_review.dart';
import 'package:base/models/user.dart';
import 'package:course_details/logic/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:base/base.dart';

class OverViewPage extends StatelessWidget {

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  final CourseDetailsController _controller = Get.find();

  final RxBool textExpanded = false.obs;

  OverViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseDetailsController>(builder: (_){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0 , left: 20.0 , top: 30.0),
            child: Text("Introduction" , style: Theme.of(context).textTheme.headlineMedium,),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Obx((){
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: !textExpanded.value ? Text(_controller.viewState.course.introduction,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ): Text(_controller.viewState.course.introduction,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            }),
          ),
          const SizedBox(height: 40.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: OutlinedButton(
                onPressed: (){
                  textExpanded.value = !textExpanded.value;
                },
                style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 19.5),
                  child: Obx((){
                    return Text(!textExpanded.value ? "See more" : "See less", style: const TextStyle(
                        color: Color(0xff265AE8),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: "jakarta"
                    ),);
                  }
                  ),
                )
            ),
          ),
          const SizedBox(height: 40.0,),
          Padding(
            padding: const EdgeInsets.only(right: 20.0 , left: 20.0),
            child: Text("Feedback" ,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 23.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xffFFF1F3)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48.0 , vertical: 24.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.star , color: Color(0xffFFA927) , size: 18.0,),
                            const SizedBox(width: 6.0,),
                            Text(_controller.viewState.course.rating.toString() , style: const TextStyle(
                                color: Color(0xff404653),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w300,
                                fontFamily: "jakarta"
                            ))
                          ],
                        ),
                        const Text("Review" , style: TextStyle(
                            color: Color(0xff404653),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: "jakarta"
                        ))
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xffFFF1F3)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48.0 , vertical: 24.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.person_outlined , color: Color(0xff404653) , size: 18.0,),
                            const SizedBox(width: 6.0,),
                            Text(calculateNumberOfStudentsInCourse(_controller.viewState.course.studentNumber).split(" ").first , style: const TextStyle(
                                color: Color(0xff404653),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w300,
                                fontFamily: "jakarta"
                            ))
                          ],
                        ),
                        const Text("Students" , style: TextStyle(
                            color: Color(0xff404653),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: "jakarta"
                        ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30.0,),
          if (_controller.viewState.courseReviews.isEmpty)
            Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            height: 200,
            child: Text("No reviews yet." , style: Theme.of(context).textTheme.headline1,)),
          if (_controller.viewState.courseReviews.isNotEmpty)
            AnimatedList(
            initialItemCount: _controller.viewState.courseReviews.length,
            shrinkWrap: true,
            key: _listKey,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            itemBuilder: (_ , index , animation){
              return SizeTransition(
                sizeFactor: animation,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/person.png"),
                        radius: 22.0,
                      ),
                      const SizedBox(width: 10.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("@${_controller.viewState.courseReviews[index].user.name}" , style: Theme.of(context).textTheme.headlineSmall,),
                          const SizedBox(height: 2.0,),
                          Text(calculateTime(_controller.viewState.courseReviews[index].timeStamp) , style: Theme.of(context).textTheme.labelSmall,),
                          const SizedBox(height: 5.0,),
                          Text(_controller.viewState.courseReviews[index].review , style: Theme.of(context).textTheme.headlineSmall,),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          if (_controller.viewState.reviewsLoading)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              height: 200,
              child: Row(
                children: const [
                  Text("Loading ..."),
                  SizedBox(width: 20.0,),
                  CircularProgressIndicator()
                ],
              ),
            ),
          const SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: OutlinedButton(
                onPressed: _controller.viewState.stopLoadingMoreReviews
                    || _controller.viewState.loadMoreReviews
                    || _controller.viewState.reviewsLoading ? null : () async {
                  var l = _controller.viewState.courseReviews.length -1;
                  await _controller.loadMoreReviews((addedItems) {
                    for (int offset = 0; offset < addedItems; offset++) {
                      _listKey.currentState!.insertItem(l + offset);
                    }
                  });
                },
                style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 19.5),
                  child: _controller.viewState.loadMoreReviews ?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("Load more" , style: TextStyle(
                              color: Color(0xff265AE8),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: "jakarta"
                          ),),
                          SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: CircularProgressIndicator())
                        ],
                      ) : const Text("Load more" , style: TextStyle(
                      color: Color(0xff265AE8),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: "jakarta"
                  ),),
                )
            ),
          ),
        ],
      );
    });
  }
}
